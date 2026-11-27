# t3c-stack

**Skills that make your AI coding agents work like a careful team, inside
[T3 Code](https://github.com/pingdotgg/t3code).**

You describe a task. One agent leads: it picks a plan, does the work, and
when a decision matters it asks Claude, GPT and Gemini to try it
separately, then keeps the best answer. It proves the result works and
never merges without you.

It uses the AI subscriptions you have already connected to T3 Code.

## Install

```bash
git clone https://github.com/disolaterX/t3c-stack.git
cd t3c-stack
./t3c.sh link
```

That's it. Claude Code, Codex, Antigravity and OpenCode all pick the skills
up. Nothing is copied: the skills are links back to this folder, so
`git pull` updates them.

Then, in any T3 Code thread:

1. Say `t3c roster` once. It picks which model does which job and saves
   it to `~/.t3c/roster.md`.
2. Say `t3c, <your task>`.

## How to use it

Start your message with the skill's name. The agents do not pick these up
from normal wording.

| Say | What happens |
|---|---|
| `t3c, <task>` | **Start here.** Picks a plan (bug fix, feature, refactor...) and works it step by step |
| `arena: <task>` | Claude, GPT and Gemini each try it on their own; a judge picks the best |
| `interrogate this diff` | The other AIs review your change; each finding is checked before anything is fixed |
| `swarm: <big task>` | Splits the work into parts and runs them at the same time |
| `architect: <problem>` | Several AIs propose designs; you get one plan |
| `t3c how: <thing>` | Explains how some code works |
| `t3c why: <thing>` | Explains why code is the way it is, from its history |
| `blast radius: <change>` | Lists everything a change will touch, before you make it |
| `verify` | Proves a change works, with real evidence |
| `tdd: <behavior>` | Writes a failing test first, then the code |
| `t3c recall: <topic>` | Finds what you decided in earlier T3 Code threads |
| `reflect` | Turns a lesson from this session into a rule |
| `t3c roster` | Shows or changes which model does which job |
| `t3c help` | Lists all of the above |

In Claude Code you can also type `/t3c-mode`, and in Codex `$t3c-mode`.

## Tips

- **Open the thread in the repo's own T3 Code project.** Helpers that write
  code get their own copy of the repo only when the thread's project is
  that repo. Otherwise they take turns on one copy.
- **Commit before `arena` or `swarm`.** Each helper starts from your last
  commit, not from unsaved edits.
- **Panels cost more.** An arena runs 3 to 4 agents. Use plain `t3c` for
  everyday work and panels for choices that matter.
- **It never merges.** It stops with a PR ready and tells you what it needs
  from you.

## What's inside

- [`skills/`](./skills) has one folder per skill.
- [`skills/t3c-mode/playbooks`](./skills/t3c-mode/playbooks) has the plans:
  bug fix, feature, investigation, refactor, perf, prototype, multi-phase
  plan, shipping, babysit, overnight, session pickup, pause safely, and
  figure it out.
- [`skills/t3c-mode/principles.md`](./skills/t3c-mode/principles.md) has
  the rules every skill follows.

If you also use the [tstack](https://github.com/t3dotgg/tstack) skills
(`full-stop`, `file-pr`, `babysit-pr`, `council`, `sol-loop`, `takeover`,
`modernize`), the plans hand off to them.

## Managing the install

```bash
./t3c.sh status   # which skills are linked where
./t3c.sh check    # check the skill files are valid
./t3c.sh unlink   # remove the links (only the ones pointing here)
```

To link somewhere else, set `T3C_SKILL_DIRS` to a colon-separated list of
folders.

## Needs

- T3 Code with at least two AI providers turned on, so panels get
  different opinions. One provider works too; panels just say so.
- `git` and `gh`.

## Where it comes from

Inspired by [pstack](https://github.com/cursor/plugins/tree/main/pstack),
Lauren Tan's Cursor plugin, and written from scratch for T3 Code. If you
want pstack's own text inside T3 Code, see
[t3-pstack](https://github.com/chhoumann/t3-pstack).

## License

[MIT](./LICENSE).
