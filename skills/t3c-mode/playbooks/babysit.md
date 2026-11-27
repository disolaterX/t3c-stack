# Babysit

Use the `babysit-pr` skill if installed. Otherwise:

1. **Check the author.** If the PR is not the user's, ask before changing
   it. Exit: permission or the user's own PR.
2. **Handle what is there.** Read checks and comments newer than the latest
   push. Verify each bot finding against the code. Fix real ones; reply with
   a reason to the rest. Exit: nothing open from before the watch.
3. **Watch.** Call `watch_pull_request` and end the turn. Only the thread
   that owns the PR watches it; children never do.
4. **On each wake,** handle the news, prove each fix before you push, and
   watch again.
5. **Ready check.** Required checks green, bots finished, findings fixed or
   answered, branch up to date and mergeable. Exit: all true on the latest
   head.
6. **Hand off.** Call `unwatch_pull_request`, then report. Never merge.
