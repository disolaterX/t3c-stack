# Pause safely

1. **Stop starting.** Start no new agents. Cancel children you will not
   wait for. Exit: nothing running that you do not track.
2. **Save the work.** Commit to the feature branch if the user allows
   commits; otherwise leave the tree as is and list the changed files.
   Never push without permission. Exit: work recoverable.
3. **Write the handoff.** In the ledger or plan file, or in your reply:
   goal, done, left, next step, open questions, and how to check the current
   state. Exit: someone else could resume from it alone.
4. **Unwatch.** Call `unwatch_pull_request` on any PR you watch.
5. **Report** the handoff and what the user needs to do.
