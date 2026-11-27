---
name: t3c-why
description: Explain why code is the way it is from its history - commits, PRs, issues and review threads. Use when the user asks "why is X like this", says "t3c why", or before removing something that looks pointless.
---

# t3c why

1. **Pin the lines.** The exact file and line range in question.
2. **Walk the history.** `git log -L` or `git blame` on the range, then
   `git log --follow` for moves. Note each commit that changed the behavior.
3. **Read the context.** For each key commit: its PR (`gh pr list --search
   <sha> --state merged`), the PR description and review comments, and any
   linked issue. Use connected tools for tickets and chat when the user has
   them.
4. **Separate fact from guess.** A stated reason in a PR or commit is fact.
   An inferred reason is a guess; label it.
5. **Answer.** Lead with the reason. Then the timeline with links. End with
   whether the reason still holds, and the command that re-checks it.
