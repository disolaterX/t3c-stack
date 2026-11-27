# Perf

1. **Name the number.** What metric, measured how, and what target. Exit: a
   command that prints the number.
2. **Measure the baseline.** Run it several times. Exit: baseline and spread
   recorded.
3. **Profile.** Find where the time or space goes. Exit: the top cost is
   named with evidence.
4. **Try fixes.** For a clear cause, fix it. For several candidate fixes,
   run `t3c-arena` with each candidate in its own worktree and the
   measurement as the judge. Exit: a fix that moves the number.
5. **Re-measure.** Same command, same conditions. Exit: the gain is larger
   than the spread.
6. **Prove nothing broke.** Run `t3c-verify`. Exit: checks green.
7. **Ship.** Follow [shipping](./shipping.md) and put the before and after
   numbers, with the command, in the PR.
