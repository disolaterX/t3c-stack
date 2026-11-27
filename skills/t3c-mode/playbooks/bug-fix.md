# Bug fix

1. **Reproduce.** Get the failure in front of you: a command, a request, a
   screen, a log line. Exit: you can make it fail on demand, or you have the
   exact evidence of the one time it failed.
2. **Read the live state.** If it happened on a running system, read that
   system before the code. Exit: you know what the system did, not what the
   docs say it should do.
3. **Find the cause.** Use `t3c-how` and `t3c-why` on the failing path. When
   the cause is unclear after one pass, run `t3c-arena` with the question
   "what causes this?" and judge the answers against the evidence. Exit: you
   can name the line or setting and explain how it produces the failure.
4. **Check the blast radius.** Run `t3c-blast-radius` on the planned fix.
   Exit: you know every caller and config the fix touches.
5. **Fix.** Smallest change at the cause. Exit: the diff touches only what
   the cause needs.
6. **Prove.** Run `t3c-verify`: the reproduction from step 1 now passes, and
   the repo's checks pass. Exit: evidence recorded.
7. **Review.** Run `t3c-interrogate` on the diff. Fix real findings. Exit:
   no open blocker.
8. **Ship.** Follow [shipping](./shipping.md) if the user wants a PR.
