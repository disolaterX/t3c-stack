---
name: t3c-roster
description: Decide which T3 Code provider and model fills each t3c role (builder, panel, judge, scout). Use before any t3c skill starts another agent, when the user says "t3c roster", or when a roster model is missing.
---

# t3c roster

The roster maps roles to providers and models. It lives at
`~/.t3c/roster.md`, outside any repo, because it describes this machine's
subscriptions.

## Roles

| Role | Job | Default pick |
|---|---|---|
| `builder` | Writes code and plans | Latest Claude Opus |
| `panel` | Independent attempts and reviews; one seat per vendor | Latest Claude Opus, latest GPT Sol, latest Gemini Neon |
| `judge` | Compares panel output and decides | Latest Claude Fable |
| `scout` | Bulk reading, searching, mechanical edits | A fast, cheap model such as DeepSeek Flash on OpenCode |

The user's own instructions win. If their CLAUDE.md or AGENTS.md names a
model for a kind of work, use it for the matching role.

## Load

1. Read `~/.t3c/roster.md`. If it is missing, go to Write.
2. Use the `orchestrator_capabilities` result already fetched in this
   thread, or call it once if there is none. Use its `search` to find any
   roster model not in the short list.
3. Check every roster entry: provider enabled, model offered, options
   valid. The live list is right; the file is a preference.
4. If an entry fails, tell the user which role, which model, and why. Ask
   whether to update the roster. Do not swap silently. Under a skill that
   forbids questions (an overnight run), drop that seat, label the result,
   and record it.

## Write

1. Call `orchestrator_capabilities`, then search for each default pick.
2. Pick the newest full model id for each default. Never guess an id or use
   an alias.
3. If a default is not offered, offer the closest available model from the
   same vendor and say it is a substitute. If no model from that vendor is
   offered, leave the seat empty and say so.
4. If several providers offer the same model, use the provider the user's
   instructions or the default pick name. Otherwise use the vendor's own
   provider (`claudeAgent` for Claude, `codex` for GPT, `antigravity` for
   Gemini). Ask the user only when none of these settles it.
5. Write `~/.t3c/roster.md` in this shape and show it to the user:

```markdown
# t3c roster

Written: <date>. Re-check: run the t3c-roster skill.

| Role | Provider | Model | Options |
| --- | --- | --- | --- |
| builder | claudeAgent | <id> | effort=high |
| panel | claudeAgent | <id> | effort=high |
| panel | codex | <id> | reasoningEffort=high |
| panel | antigravity | <id> | thought_level=high |
| judge | claudeAgent | <id> | effort=high |
| scout | opencode | <id> | |
```

Provider names are T3 Code `providerInstanceId` values. Options use the ids
and values `orchestrator_capabilities` lists for that model.

## Change

When the user says to change a role, edit that row, re-check it against the
live list, and show the new table.
