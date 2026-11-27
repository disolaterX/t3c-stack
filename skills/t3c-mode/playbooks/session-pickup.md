# Session pickup

Use the `takeover` skill if the user asked to take over a PR or thread and
it is installed. Otherwise:

1. **Find the earlier work.** Use `t3c-recall` with what the user said.
   Exit: the thread, branch or PR identified.
2. **Read state, not memory.** `git status`, the branch's commits, the PR's
   checks and comments, any ledger or plan file. Exit: you know what is done
   and what is not, from artifacts.
3. **Check ownership.** If the branch or PR belongs to someone else, ask
   before changing it.
4. **Restate.** One paragraph: goal, done, left, next step. Exit: the user
   could correct it in one reply.
5. **Continue** with the playbook that fits the remaining work.
