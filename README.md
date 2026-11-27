# t3c-stack

An agent workflow stack built for [T3 Code](https://github.com/pingdotgg/t3code).
One router picks a playbook for the task. Panels run the same work on
Claude, GPT and Gemini at once, through the subscriptions T3 Code already
connects, and the lead agent judges the results.

The idea comes from [pstack](https://github.com/cursor/plugins/tree/main/pstack),
Lauren Tan's Cursor plugin. pstack's ports to other agents have to fake
Cursor's subagents and mixed-model panels inside one vendor. T3 Code already
starts agents on any connected provider, so t3c-stack uses that directly.
The text here is written from scratch.

For pstack itself inside T3 Code, with upstream's skill text, see
[t3-pstack](https://github.com/chhoumann/t3-pstack). t3c-stack is smaller
and its own: plain skill folders with no plugin or Node installer, one
shared folder that Claude Code, Codex, Antigravity and OpenCode all read,
and hand-offs to the tstack skills.

## What you get

| Skill | What it does |
|---|---|
| [`t3c-mode`](./skills/t3c-mode) | Router. Picks a playbook, turns it into a todo list, works it |
| [`t3c-roster`](./skills/t3c-roster) | Maps roles (builder, panel, judge, scout) to providers and models |
| [`t3c-arena`](./skills/t3c-arena) | Same task on several vendors, judged blind, best parts combined |
| [`t3c-interrogate`](./skills/t3c-interrogate) | One round of cross-vendor read-only review; every finding checked |
| [`t3c-swarm`](./skills/t3c-swarm) | Independent parts in parallel, one result |
| [`t3c-architect`](./skills/t3c-architect) | Independent designs from several vendors, then one plan |
| [`t3c-how`](./skills/t3c-how) | How code works, traced through real paths |
| [`t3c-why`](./skills/t3c-why) | Why code is this way, from commits, PRs and issues |
| [`t3c-blast-radius`](./skills/t3c-blast-radius) | What a change touches before you make it |
| [`t3c-verify`](./skills/t3c-verify) | The most direct proof a change works |
| [`t3c-tdd`](./skills/t3c-tdd) | Red, green, refactor |
| [`t3c-recall`](./skills/t3c-recall) | Find and read earlier T3 Code threads |
| [`t3c-reflect`](./skills/t3c-reflect) | Turn a lesson into a rule, check or name |
| [`t3c-help`](./skills/t3c-help) | What the stack offers and how to start |

Playbooks, in [`skills/t3c-mode/playbooks`](./skills/t3c-mode/playbooks):
bug fix, feature, investigation, refactor, perf, prototype, multi-phase
plan, shipping, babysit, overnight, session pickup, pause safely, and
figure it out. The [principles](./skills/t3c-mode/principles.md) apply to
all of them.

If you have the [tstack](https://github.com/t3dotgg/tstack) skills
(`full-stop`, `file-pr`, `babysit-pr`, `council`, `sol-loop`, `takeover`,
`modernize`), the playbooks hand off to them.

## How it maps to pstack

| pstack in Cursor | t3c-stack in T3 Code |
|---|---|
| `/poteto-mode` router and playbooks | `t3c-mode` and its playbooks |
| Subagents with a model per role | `t3c-roster` roles, started with `delegate_task` or the native subagent tool |
| Mixed-vendor `/arena`, `/interrogate` | `t3c-arena`, `t3c-interrogate` across Claude, Codex, Antigravity and OpenCode |
| `/swarm`, `/architect` | `t3c-swarm`, `t3c-architect` |
| Background agents, worktrees | Background `delegate_task` with `isolation: "worktree"` |
| `/loop` and overnight runs | The overnight playbook with `schedule_task` or the harness loop |
| Browser checks | `t3c-verify` with T3 Code's preview tools |
| `/recall` over Cursor transcripts | `t3c-recall` over T3 Code threads |
| `/reflect`, `/correct` | `t3c-reflect` |
| `pstack-models.mdc` | `~/.t3c/roster.md`, checked against the live provider list on every use |

Outside T3 Code the skills still load. Panels fall back to native subagents,
or to sequential passes labelled as not independent.

## Install

```bash
git clone https://github.com/disolaterX/t3c-stack.git
cd t3c-stack
./t3c.sh link
```

`link` symlinks each skill into `~/.claude/skills` (Claude Code) and
`~/.agents/skills` (Codex, OpenCode, Pi and other agents that read the
shared folder). It never replaces an existing file or a link that points
elsewhere. Set `T3C_SKILL_DIRS` to change the targets.

```bash
./t3c.sh status   # link state per skill and target
./t3c.sh check    # validate frontmatter, names and links
./t3c.sh unlink   # remove only the links that point here
```

Then, in any T3 Code thread, say `t3c roster` to pick models for each role,
and `t3c, <task>` to start.

## Requirements

- T3 Code with at least two providers enabled for real panels. One provider
  still works, with panels labelled as single-vendor.
- `git` and `gh` for the history and shipping steps.

## License

[MIT](./LICENSE).
