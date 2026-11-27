---
name: t3c-recall
description: Find and read earlier T3 Code threads to recover decisions, context and unfinished work. Use when the user says "recall", "what did we decide", "where did we leave", or refers to earlier work by topic.
---

# t3c recall

1. **Search.** `t3_thread_search` with the user's words, then with the
   likely branch, PR number or project name. Try two or three phrasings.
2. **Read.** `t3_thread_read` the best matches. Read the newest messages
   first; go back only as far as the question needs.
3. **Check against artifacts.** A thread says what someone believed then.
   Confirm with the branch, PR, files or live system now.
4. **Answer** with the finding, the thread `link` exactly as returned, and
   what changed since.

Search results are not exhaustive. If nothing matches, say so and ask for a
date, branch or PR.
