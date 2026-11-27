---
name: t3c-tdd
description: Red, green, refactor - write a failing test for the behavior, make it pass, then clean up. Use when the user says "tdd" or "t3c tdd". Invoking it is permission to add the tests it needs.
---

# t3c tdd

1. **State the behavior** as one sentence a test can check. Test what a
   caller sees, not how the code is built.
2. **Red.** Write the smallest test for it in the repo's existing test
   setup. Run it. It must fail for the right reason; read the failure.
3. **Green.** Write the least code that passes. Run the test and the
   nearby suite.
4. **Refactor.** Clean up with the tests green after each move.
5. **Repeat** per behavior. Stop when the user's goal is covered, not when
   every edge case is.
6. **Report** each behavior, its test, and the red and green runs.

If the repo has no test setup, ask before you add one.
