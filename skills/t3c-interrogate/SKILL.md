---
name: t3c-interrogate
description: One round of read-only review of a diff or plan by several vendors in T3 Code, with every finding checked by the lead. Use when the user says "interrogate", before shipping, or when a change needs eyes from outside the model that wrote it. For scored multi-round review use the council skill instead.
---

# t3c interrogate

Reviewers from different vendors read the same change and report findings.
You check each finding against the code before you act on it.

Follow [delegation.md](../t3c-mode/references/delegation.md). Load the
roster with `t3c-roster`.

## Steps

1. **Freeze the change.** Note the repo path, base commit and the diff
   command. Do not edit those files until every reviewer is done.
2. **Run the checks** the repo has for this change. Put the results in the
   brief.
3. **Start reviewers** from the roster's `panel` rows, read-only, in
   parallel, in the background. Skip the seat whose model wrote the change
   if another vendor can fill it.
4. **Check each finding** as it arrives: open the file, follow the code,
   reproduce if you can. Mark it `real`, `wrong` or `nit`.
5. **Fix real findings** after all reviewers finish. Smallest fix each.
   Decline nits in one line.
6. **Stop.** This is one round. If a fix changed behavior and the user wants
   another look, run this skill again on the new diff.

## Brief

```
Review only. Do not edit, commit, push, comment, or start agents.
Repo: <abs path>  Base: <sha>  Diff: <command>
Intent: <one or two sentences>  Out of scope: <list>
Checks: <commands and results>
Find bugs, broken callers, and mismatches with the intent. Skip style
unless it hides a bug. Flag code the intent does not need.
blocker = the intended case is wrong. should = a real bug callers will hit.
nit = everything else.
Reply:
VERDICT: APPROVE or CHANGES
F1 [blocker|should|nit] <file>:<line> <claim>. Fix: <suggestion>
```

## Report

A table: finding, reviewer vendor, your verdict, action taken. Then which
reviewers approved and what is left open.
