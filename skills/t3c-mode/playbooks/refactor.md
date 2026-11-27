# Refactor

1. **Pin behavior.** Find the checks that cover the code. If none do, ask
   whether to add them (`t3c-tdd` counts as permission). Exit: a command
   that passes now and must still pass after.
2. **Check the blast radius.** Run `t3c-blast-radius`. Exit: every caller
   listed.
3. **Plan the moves.** Small steps, each one leaving the code working.
   Move callers first, then delete the old path. Exit: a short ordered list.
4. **Move.** One step at a time. Run the pinned checks after each. Exit:
   checks green after every step.
5. **Subtract.** Delete what the new shape makes dead. Exit: no unused code
   left behind.
6. **Review.** Run `t3c-interrogate` with the instruction "behavior must not
   change; find any place it does". Exit: no open blocker.
7. **Ship.** Follow [shipping](./shipping.md).
