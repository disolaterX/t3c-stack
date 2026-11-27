# Shipping

If the user said "full stop", use the `full-stop` skill. If they said "full
send", use `full-stop` as well; never merge. Otherwise:

1. **Confirm proof.** Every change in the diff has evidence from
   `t3c-verify`. Exit: no unproven change.
2. **Review.** If the user asked for `council` or `sol-loop`, run it.
   Otherwise run `t3c-interrogate`. Exit: no open blocker.
3. **Branch.** If on the default branch, create a branch. Exit: on a
   feature branch.
4. **Ask before publishing.** Committing, pushing and opening a PR need the
   user's word unless a skill they invoked grants it. Exit: permission, or
   stop here and hand off.
5. **File the PR.** Use `file-pr` if installed. Otherwise: rebase on the
   default branch, open a real PR (not a draft) that leads with the problem,
   then the fix, then one line on how it was proven. Exit: PR open.
6. **Babysit.** Follow [babysit](./babysit.md) until the merge gate passes.
7. **Stop at the gate.** Never merge, enable auto-merge or join a merge
   queue. Report the PR link, head commit, proof and review outcome.
