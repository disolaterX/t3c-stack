---
name: t3c-blast-radius
description: Before a change, list everything it touches - callers, configs, deploys, data, other repos and people. Use when the user says "blast radius", before refactors, deletions, renames, schema or config changes.
---

# t3c blast radius

1. **Name the change** in one line, and the symbols, files, keys or tables
   it touches.
2. **Find direct users.** Search for every reference: code, tests, configs,
   scripts, CI, docs. For a large repo, split the search across `scout`
   agents.
3. **Find indirect users.** Serialized formats, public APIs, env vars,
   feature flags, cron jobs, dashboards and alerts, other repos the user
   owns. Check live systems where the user's tools reach them.
4. **Find owners.** Who else works on what you touch (`git log` authors,
   CODEOWNERS, open PRs on the same files).
5. **Report** a table: thing touched, how, risk (break, behavior change,
   none), and how to check it after the change. End with the open PRs and
   people to tell.
