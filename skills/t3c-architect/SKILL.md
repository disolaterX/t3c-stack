---
name: t3c-architect
description: Get independent designs from several vendors in T3 Code, then choose one and write a plan with checkpoints. Use when the user says "architect", when a feature or refactor has no obvious shape, or before a multi-phase plan.
---

# t3c architect

Follow [delegation.md](../t3c-mode/references/delegation.md). Load the
roster with `t3c-roster`.

## Steps

1. **Write the problem.** Goal, constraints, what exists today, what must
   not change, and how success is checked. Use `t3c-how` first if you do not
   know the area.
2. **Get designs.** Run `t3c-arena` in answer mode. Each seat returns the
   design format below. Seats do not see each other.
3. **Compare.** Put the designs side by side on: fit with the existing code,
   size of change, failure modes, how each is proven, and what each makes
   harder later. Prefer the design that removes the most.
4. **Choose.** Pick one. Take a part from another only when it removes a
   real risk. Write the reason in two or three lines.
5. **Plan.** Ordered steps, each one shippable and checkable, with a
   checkpoint where the user can stop or redirect.
6. **Stop for the user** if the choice is costly to undo. Otherwise
   continue with the playbook that called this skill.

## Design format

```
APPROACH: <two or three lines>
CHANGES: <modules and files>
DATA AND STATE: <what moves, what is stored>
FAILURE MODES: <what breaks and how you would see it>
PROOF: <how to show it works>
COST: <size, risk, what it makes harder>
```
