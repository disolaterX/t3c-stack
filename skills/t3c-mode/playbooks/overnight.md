# Overnight

The user is not watching. Nobody will answer a question until morning.

1. **Write the stop condition.** A command whose output says done or not
   done. Exit: the command runs and currently says not done.
2. **Write the ledger.** A file outside the repo, such as
   `~/.t3c/ledgers/<repo>-<branch>.md` with any `/` in the branch replaced
   by `-`, listing the goal, the stop command, what is allowed,
   and what needs the user. Exit: the file exists.
3. **Set the limits.** Never merge, push to the default branch, delete
   data or touch production. Never
   push, open a PR or post on GitHub unless the ledger records that the user
   allowed it. Spend cap: a number of rounds or hours the user set,
   or 8 rounds if they set none. Exit: limits written in the ledger.
4. **Loop.** Each round: read the ledger, take the next step, run the stop
   command, append what happened. For the next round, schedule one `once`
   run with `schedule_task` whose prompt names the ledger path, or use the
   harness's loop; never a sleep loop
   or an interval schedule. Exit: the stop command says done, or the cap is
   reached.
5. **Stop the schedule.** When done, capped or paused, delete any schedule
   you created with `delete_scheduled_task`, and stop any harness loop.
6. **When blocked,** record the blocker in the ledger, try another path if
   one is safe, and keep going with what does not depend on it.
7. **Report.** The stop command's final output, a link to the ledger, and a
   short list of what the user must decide.
