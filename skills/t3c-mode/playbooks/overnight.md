# Overnight

The user is not watching. Nobody will answer a question until morning.

1. **Write the stop condition.** A command whose output says done or not
   done. Exit: the command runs and currently says not done.
2. **Write the ledger.** A file in the repo or worktree, such as
   `.t3c/ledger.md`, listing the goal, the stop command, what is allowed,
   and what needs the user. Exit: the file exists.
3. **Set the limits.** Never merge, push to the default branch, delete data
   or touch production. Spend cap: a number of rounds or hours the user set,
   or 8 rounds if they set none. Exit: limits written in the ledger.
4. **Loop.** Each round: read the ledger, take the next step, run the stop
   command, append what happened. Use `schedule_task` or the harness's loop
   for later rounds, never a sleep loop. Exit: the stop command says done,
   or the cap is reached.
5. **When blocked,** record the blocker in the ledger, try another path if
   one is safe, and keep going with what does not depend on it.
6. **Report.** The stop command's final output, the ledger, and a short
   list of what the user must decide.
