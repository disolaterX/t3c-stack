# Delegation in T3 Code

Every t3c skill that starts another agent follows these rules.

## Pick the route

- Call `orchestrator_capabilities` once per thread before the first
  delegation. Call it again only after an error or a provider change.
- Resolve each role from the roster (`t3c-roster`). If a roster model is
  not offered or its provider is disabled, report it. Do not swap in
  another model without saying so.
- Child on your own provider, a model it offers, no extra settings, and you
  wait for it: use your native subagent tool (Claude `Agent` with
  `run_in_background: false`, Codex `spawn_agent`). Start several in one
  message to run them together.
- Child on another provider, with extra settings, in its own worktree, or
  in the background: use `delegate_task`. Settings go in `target.options`.
- If several enabled providers offer the same model, use the provider the
  user or the roster names, else the vendor's own provider (see
  `t3c-roster`). Ask the user only when that leaves it open.

## Outside T3 Code

If `delegate_task` and `orchestrator_capabilities` are missing after one
try, you are not in T3 Code. Use native subagents with distinct models when
the harness allows. Otherwise run the roles one after another yourself and
label the result "sequential, not independent". Never present that as a
panel.

## Brief

A child sees only its brief. Every brief states:

- **Goal:** one or two sentences.
- **Repo and base:** absolute path, branch, base commit.
- **Scope:** files or areas in scope, and what is out of scope.
- **Access:** read-only, or which files it may change.
- **Proof:** how it shows its result is right.
- **Reply:** the exact format to return.
- **Limits:** no subagents, no PR comments, no pushing, no watching PRs,
  unless the brief says otherwise.

## Isolation

- Agents that write code get `isolation: "worktree"`, one worktree each. A
  worktree starts from your last commit and leaves uncommitted edits out.
  Commit first, with the user's permission, or the child will not see your
  work.
- Children always run in your thread's T3 Code project, and
  `isolation: "worktree"` copies that project's folder. Run the lead in a
  thread whose project is the repo. If it is not, never make checkouts in
  the shell: ask the user to start the work in a thread of that repo's
  project, registering the repo as a project if needed, or run writers one
  at a time on the shared checkout and label the result.
- Reviewers are read-only on the checkout they review. Only the brief
  enforces this; T3 Code has no read-only mode.
- Do not edit files that a running reviewer is reading.

## Waiting

- Run `delegate_task` children in the background. Do useful work while
  they run.
- Do not poll, sleep, or start watchers. T3 Code tells you when a child
  finishes.
- When a result arrives, check it against the artifact at once.
- Cancel children you no longer need with `task_cancel`. A timeout, an
  error or no reply is not approval.

## Size

- Default panel: three agents, one per vendor. A panel with fewer than two
  vendors is labelled `single-vendor` in its report.
- More than six agents in one step needs a reason you can state in one line.
- Use the `scout` role for bulk reading and searching. Use `builder`, `panel`
  and `judge` for judgment.
