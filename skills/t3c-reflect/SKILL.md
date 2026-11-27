---
name: t3c-reflect
description: Turn a lesson from this session into a durable rule, check or name so the mistake does not repeat. Use when the user says "reflect", "remember this", "don't do that again", or after a correction.
---

# t3c reflect

1. **Name the lesson** in one sentence: what went wrong or right, and the
   rule that follows.
2. **Pick the strongest home,** in this order:
   - a check that fails when the rule breaks (lint, CI step, script),
   - a type or name that makes the wrong thing hard,
   - a line in the repo's `AGENTS.md` or `CLAUDE.md`,
   - a line in the user's global instructions, for lessons beyond this repo,
   - a new or changed t3c playbook, for a workflow that will recur.
3. **Draft the change.** One rule, the why in a few words. Keep the user's
   writing style. No dates or counts that will rot.
4. **Show it and ask** before writing to global instructions or to a file
   others share. Repo changes follow the user's commit rules.
5. **Report** where the lesson now lives.
