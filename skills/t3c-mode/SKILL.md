---
name: t3c-mode
description: Router for the t3c stack. Use when the user says "t3c", "t3c mode", or names a t3c playbook. Matches the task to a playbook, turns its steps into a todo list, and runs them with T3 Code's cross-provider agents.
---

# t3c mode

You are the lead. You own the result, talk to the user, and decide. Other
agents work for you through T3 Code.

## Start

1. Read [principles.md](./principles.md). They apply to every step.
2. Read [references/delegation.md](./references/delegation.md) before you
   start any other agent.
3. Load the roster with the `t3c-roster` skill. If no roster exists, that
   skill writes one first.
4. Pick one playbook from the table. If two fit, pick the one closer to what
   the user will check at the end. If none fit, use
   [figure-it-out](./playbooks/figure-it-out.md).
5. Copy the playbook's steps into your todo list, in order. Say in one line
   which playbook you picked and why.
6. Work the list. Mark a step done only when its exit check holds.

## Playbooks

| Playbook | Use when |
|---|---|
| [bug-fix](./playbooks/bug-fix.md) | Something that worked is broken, or a report names wrong behavior |
| [feature](./playbooks/feature.md) | New behavior the user asked for |
| [investigation](./playbooks/investigation.md) | The user wants an answer, not a change |
| [refactor](./playbooks/refactor.md) | Same behavior, better structure |
| [perf](./playbooks/perf.md) | Too slow, too big, too costly, with a number to move |
| [prototype](./playbooks/prototype.md) | Prove an idea fast; the code may be thrown away |
| [multi-phase-plan](./playbooks/multi-phase-plan.md) | Work too big for one PR; write the plan and stop |
| [shipping](./playbooks/shipping.md) | Take finished work to a PR that is ready to merge |
| [babysit](./playbooks/babysit.md) | A PR exists and needs CI and review handled |
| [overnight](./playbooks/overnight.md) | Run until a checkable condition holds, with no one watching |
| [session-pickup](./playbooks/session-pickup.md) | Continue work from an earlier thread or branch |
| [pause-safely](./playbooks/pause-safely.md) | Stop mid-work so someone can resume it |
| [figure-it-out](./playbooks/figure-it-out.md) | Nothing above fits |

## Skills the playbooks call

| Skill | Role |
|---|---|
| `t3c-roster` | Which provider and model fills each role |
| `t3c-arena` | Same task on several vendors, judge, combine the best |
| `t3c-interrogate` | One round of read-only review from several vendors |
| `t3c-swarm` | Split work into independent parts, run them in parallel |
| `t3c-architect` | Independent designs from several vendors, then one plan |
| `t3c-how` | Explain how code works |
| `t3c-why` | Explain why code is the way it is, from history |
| `t3c-blast-radius` | What a change touches before you make it |
| `t3c-verify` | Prove a change works with the most direct evidence |
| `t3c-tdd` | Red, green, refactor |
| `t3c-recall` | Find and read earlier T3 Code threads |
| `t3c-reflect` | Turn a lesson from this session into a durable rule |
| `t3c-retro` | Weekly review of T3 Code threads, one fix PR, council, report |
| `t3c-help` | List what the stack has |

The user's own skills take over where they exist. Before a playbook's
fallback steps, check for `full-stop`, `file-pr`, `babysit-pr`, `council`,
`sol-loop`, `takeover` and `modernize`, and use them instead.

## Stop

Finish when the playbook's last exit check holds. Report what changed, the
proof, and what is left. If the next step needs the user, say exactly what
to do and what to send back.
