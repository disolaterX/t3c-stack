# Investigation

1. **Restate the question.** One sentence. Say what would count as an
   answer. Exit: the user would agree with the restatement.
2. **Gather.** Send `scout` agents to read code, logs and history in
   parallel (`t3c-swarm` with read-only workers). Read live systems
   yourself or through the user's tools. Exit: each source checked or
   marked unreachable.
3. **Form answers.** For a contested question, run `t3c-arena` in answer
   mode so different vendors reach a conclusion on their own. Exit: one
   answer per agent, each with evidence.
4. **Judge.** Check each claim against the evidence. Keep what holds. Exit:
   every claim in your answer has a source.
5. **Report.** Lead with the answer. Then the evidence, what you could not
   check, and the command that re-checks anything that changes over time.
