# Prototype

1. **Name the question the prototype answers.** Exit: one sentence, and
   what result would mean yes or no.
2. **Pick the shortest path.** Skip polish, tests and edge cases. Exit: a
   plan that fits in a few steps.
3. **Build it.** In a worktree or scratch folder, never on a branch someone
   will ship by accident. For a question with more than one plausible
   approach, `t3c-arena` can build each in parallel. Exit: it runs.
4. **Run it and look.** Use `t3c-verify` for the observation, not for
   coverage. Exit: you saw the answer.
5. **Report.** The answer to the question, the evidence, and what a real
   build would need that the prototype skipped.
