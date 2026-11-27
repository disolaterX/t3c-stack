# Multi-phase plan

1. **Pin the end state.** What is true when all phases ship. Exit: a
   checkable outcome.
2. **Design.** Run `t3c-architect`. Exit: one chosen design.
3. **Cut phases.** Each phase ships alone, leaves the system working, and
   has its own proof. Move callers before you delete old paths. Exit: an
   ordered list of phases.
4. **Write the plan.** One file in the repo, such as `docs/plans/<name>.md`,
   or in the thread if the user prefers. Per phase: goal, scope, proof,
   risks, and what it unblocks. Exit: someone else could start phase 1 from
   the file alone.
5. **Stop.** Do not start building. Reply with the plan's link, one short
   bullet per user requirement showing what's broken and what changes, and
   the decisions blocking phase 1, each with your default. Phases, risks and
   per-phase proof stay in the file.
