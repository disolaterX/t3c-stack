# Feature

1. **Pin the outcome.** Write one or two sentences on what the user will
   see or be able to do. Exit: the outcome is checkable.
2. **Map the ground.** Use `t3c-how` on the area you will change. Exit: you
   know where the change goes and what it must not break.
3. **Design.** Small and obvious: write the approach in a few lines. Not
   obvious, or more than one sound approach: run `t3c-architect`. Exit: one
   chosen approach, with the reason.
4. **Check the blast radius.** Run `t3c-blast-radius`. Exit: callers,
   configs and deploys listed.
5. **Build.** One unit at a time, each one checkable. Independent parts can
   go to `t3c-swarm`. Hard parts with real risk can go to `t3c-arena`.
   Exit: every unit builds and passes its check.
6. **Prove.** Run `t3c-verify` against the outcome from step 1. Exit:
   evidence for each part of the outcome.
7. **Review.** Run `t3c-interrogate`, or `council` when the user asked for
   scored rounds. Exit: no open blocker.
8. **Ship.** Follow [shipping](./shipping.md).
