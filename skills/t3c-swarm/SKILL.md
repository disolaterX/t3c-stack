---
name: t3c-swarm
description: Split work into independent parts and run them in parallel with T3 Code agents, then merge into one result. Use when the user says "swarm", for wide read-only sweeps, or for changes that split cleanly by file or module.
---

# t3c swarm

Many workers, each on its own part, then one report or one merged change.

Follow [delegation.md](../t3c-mode/references/delegation.md). Load the
roster with `t3c-roster`.

## Steps

1. **Split.** List the parts. Parts must not depend on each other or edit
   the same files. If two parts touch one file, merge them into one part.
2. **Pick workers.** Reading and searching: `scout`. Code changes:
   `builder`. Mixed vendors are optional here; speed and cost matter more.
3. **Start them** with `delegate_task` in the background, or batch them when
   there are many. Code workers get `isolation: "worktree"` each.
   Read-only workers share the checkout.
4. **Collect.** Check each result against its part's proof as it arrives.
   Send a part back once with the specific gap if it falls short; after
   that, do it yourself.
5. **Merge.** Read-only: write one report, grouped by question, not by
   worker. Code: apply each worktree's change on one branch in order, run
   the full checks after the last one.

## Worker brief

```
Goal: <this part only>
Repo: <abs path>  Base: <sha>
Your files: <list>  Do not touch: <everything else>
Access: <read-only | may edit your files>
Proof: <command or check>
Reply: RESULT, PROOF, CHANGED, SKIPPED
No subagents, no commits to shared branches, no pushing.
```

## Report

Parts done, parts redone or taken back, the merged proof, and anything a
worker flagged that crosses parts.
