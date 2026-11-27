#!/usr/bin/env bash
set -euo pipefail

src="${BASH_SOURCE[0]}"
while [ -L "$src" ]; do
  dir="$(cd -P "$(dirname "$src")" && pwd)"
  src="$(readlink "$src")"
  case "$src" in /*) ;; *) src="$dir/$src" ;; esac
done
REPO="$(cd -P "$(dirname "$src")" && pwd)"
SKILLS="$REPO/skills"
if [ -n "${T3C_SKILL_DIRS:-}" ]; then
  IFS=: read -r -a TARGETS <<< "$T3C_SKILL_DIRS"
else
  TARGETS=("$HOME/.claude/skills" "$HOME/.agents/skills")
fi

usage() {
  cat <<EOF
usage: $0 <command>

  link     link every t3c skill into: ${TARGETS[*]}
  unlink   remove links that point into this repo
  status   show link state per skill and target
  check    validate skill files (frontmatter, names, relative links)

Set T3C_SKILL_DIRS to a colon-separated list of directories to change targets.
EOF
}

skill_names() {
  for d in "$SKILLS"/*/; do
    if [ -f "${d}SKILL.md" ]; then basename "$d"; fi
  done
}

cmd_link() {
  local target name dst
  for target in "${TARGETS[@]}"; do
    [ -n "$target" ] || continue
    mkdir -p "$target"
    echo "$target"
    for name in $(skill_names); do
      dst="$target/$name"
      if [ -L "$dst" ]; then
        if [ "$(readlink "$dst")" = "$SKILLS/$name" ]; then
          echo "  ok       $name"
          continue
        fi
        echo "  skip     $name (link points to $(readlink "$dst"))"
        continue
      fi
      if [ -e "$dst" ]; then
        echo "  skip     $name (an existing file or directory is in the way)"
        continue
      fi
      ln -s "$SKILLS/$name" "$dst"
      echo "  linked   $name"
    done
  done
}

cmd_unlink() {
  local target name dst
  for target in "${TARGETS[@]}"; do
    [ -n "$target" ] || continue
    echo "$target"
    for name in $(skill_names); do
      dst="$target/$name"
      if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$SKILLS/$name" ]; then
        rm "$dst"
        echo "  removed  $name"
      fi
    done
  done
}

cmd_status() {
  local target name dst state
  for target in "${TARGETS[@]}"; do
    [ -n "$target" ] || continue
    echo "$target"
    for name in $(skill_names); do
      dst="$target/$name"
      if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$SKILLS/$name" ]; then
        state="linked"
      elif [ -L "$dst" ]; then
        state="other link -> $(readlink "$dst")"
      elif [ -e "$dst" ]; then
        state="existing file or directory"
      else
        state="not linked"
      fi
      printf "  %-20s %s\n" "$name" "$state"
    done
  done
}

frontmatter_value() {
  awk -v key="$2" '
    NR == 1 && $0 != "---" { exit }
    NR > 1 && $0 == "---" { exit }
    NR > 1 && index($0, key ": ") == 1 { print substr($0, length(key) + 3); exit }
  ' "$1"
}

check_links() {
  local file="$1" base link path
  base="$(dirname "$file")"
  { grep -o '](\([^)]*\))' "$file" | grep -v '](\(https\{0,1\}\|mailto\):' || true; } | sed 's/^](//; s/)$//; s/#.*$//' | while read -r link; do
    [ -n "$link" ] || continue
    path="$base/$link"
    [ -e "$path" ] || echo "$file: broken link $link"
  done
}

cmd_check() {
  local errors=0 count=0 name file desc out
  for name in $(skill_names); do
    count=$((count + 1))
    file="$SKILLS/$name/SKILL.md"
    if [ "$(head -n 1 "$file")" != "---" ]; then
      echo "$file: missing frontmatter"
      errors=$((errors + 1))
      continue
    fi
    if [ "$(frontmatter_value "$file" name)" != "$name" ]; then
      echo "$file: name must be $name"
      errors=$((errors + 1))
    fi
    case "$name" in t3c-*) ;; *) echo "$file: name must start with t3c-"; errors=$((errors + 1)) ;; esac
    desc="$(frontmatter_value "$file" description)"
    if [ -z "$desc" ]; then
      echo "$file: missing description"
      errors=$((errors + 1))
    elif [ "${#desc}" -gt 1024 ]; then
      echo "$file: description is ${#desc} characters, limit 1024"
      errors=$((errors + 1))
    fi
  done
  while IFS= read -r file; do
    out="$(check_links "$file")"
    if [ -n "$out" ]; then
      echo "$out"
      errors=$((errors + $(printf '%s\n' "$out" | wc -l)))
    fi
  done < <(find "$SKILLS" "$REPO/README.md" -name '*.md' -type f)
  if [ "$count" -eq 0 ]; then
    echo "no skills found in $SKILLS"
    errors=$((errors + 1))
  fi
  if [ "$errors" -gt 0 ]; then
    echo "check failed: $errors problem(s) in $count skill(s)"
    return 1
  fi
  echo "check passed: $count skills"
}

case "${1:-}" in
  link) cmd_link ;;
  unlink) cmd_unlink ;;
  status) cmd_status ;;
  check) cmd_check ;;
  *) usage; [ -z "${1:-}" ] || exit 2 ;;
esac
