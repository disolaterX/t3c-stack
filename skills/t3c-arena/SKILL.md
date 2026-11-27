---
name: t3c-arena
description: Run the same task on several vendors at once in T3 Code, judge the results, and combine the best parts. Use when the user says "arena", when a hard change has more than one plausible approach, or when a question needs independent answers.
---

# t3c arena

Several agents from different vendors attempt the same task on their own.
You judge, then keep the best one or graft the best parts together.

Follow [delegation.md](../t3c-mode/references/delegation.md). Load the
roster with `t3c-roster`.

## Modes

- **Code:** each seat changes code in its own worktree.
- **Answer:** each seat answers a question read-only. Use it for root
  causes, designs and contested facts.

## Steps

1. **Write one brief** that every seat gets unchanged: goal, repo and base
   commit, scope, proof the seat must run, and the reply format below. Do
   not hint at an approach.
2. **Start the seats** from the roster's `panel` rows, in parallel, in the
   background. Code mode: `isolation: "worktree"` for each. Answer mode:
   read-only.
3. **While they run,** write down what a winning result must show. Decide
   this before you read any result.
4. **Collect.** For each seat: its diff or answer, its proof output, and
   what it skipped. A seat that errors or times out is out; say so.
5. **Judge.** For two seats or fewer, judge yourself. For three or more, or
   when you wrote one of the attempts, give the `judge` role the criteria
   and the results without vendor names, labelled A, B, C. Check the
   judge's reasons against the code yourself.
6. **Graft.** Start from the winner. Take a part from another seat only
   when it is better on its own and fits without glue. Run the proof again
   on the result.
7. **Clean up.** Keep the winning worktree or branch. List the others for
   the user; do not delete them unless asked.

## Seat reply format

```
RESULT: <one line>
PROOF: <command> -> <output summary>
CHANGED: <files> (code mode)
SKIPPED: <what was not done and why>
RISKS: <what could be wrong>
```

## Report

Which seat won and why, what was grafted from others, the proof on the final
result, and the vendors and models that ran.
