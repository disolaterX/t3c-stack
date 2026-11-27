---
name: t3c-how
description: Explain how a piece of code or a system works, traced through the real code paths. Use when the user asks "how does X work", says "t3c how", or before changing an area you do not know.
---

# t3c how

Follow [delegation.md](../t3c-mode/references/delegation.md) and load
`t3c-roster` before starting `scout` agents.

1. **Find the entry points.** Where the behavior starts: a route, a
   command, a handler, a config key. For a large or unfamiliar repo, send
   `scout` agents to search in parallel and return file and line lists.
2. **Trace the path.** Follow the call chain from entry to effect. Read the
   code yourself on the main path; agents may summarize side paths.
3. **Check it runs that way.** Where you can, run it, log it, or read the
   live system. Note anything the code says that the runtime contradicts.
4. **Explain.** Lead with a few sentences a newcomer would follow. Then the
   path as a numbered list of `file:line` steps. Add a small diagram only if
   the flow branches.
5. **Mark gaps.** Say which parts you read, which an agent summarized, and
   which you could not check.
