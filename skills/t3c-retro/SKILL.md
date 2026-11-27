---
name: t3c-retro
description: Weekly review of the user's T3 Code threads. Several models judge what went wrong, the lead opens one PR to t3c-stack with the fixes, a council reviews it, and the user gets a report. Use when the user says "t3c retro" or a scheduled run asks for it.
---

# t3c retro

Find what made last week's agent work slow, wrong or annoying, fix what
belongs in t3c-stack, and tell the user the rest.

Follow [delegation.md](../t3c-mode/references/delegation.md). Load the
roster with `t3c-roster`.

## Rules for this skill

- **Authorization.** Invoking this skill, directly or from a schedule, is
  the user's permission to push one `retro/<YYYY-MM-DD>` branch and open one
  unmerged PR to t3c-stack per run. Nothing else: never merge, never push to
  the default branch, never touch another repo.
- **Unattended.** Ask no questions. The roster's provider settles any
  duplicate-provider choice. A seat that cannot be filled is dropped and
  marked `unavailable` in the report. Fewer than two panel vendors: label
  the result `single-vendor`. No judge: you merge. No scout: read fewer
  threads yourself.
- **Privacy.** t3c-stack is public. The PR title, body, commit messages and
  diff must not contain names of people, clients, companies, repos,
  projects or services, hostnames, IPs, URLs other than t3c-stack's, IDs,
  ticket keys, secrets, or quotes from threads. Describe problems in general
  terms. Thread links and quotes go only in the report to the user. Check
  all four parts before every push and every PR description edit.
- **Cost.** At most 14 agents: 4 scouts, 3 panel seats, 1 judge, and 2
  council rounds of 3 seats. No retries.

## Steps

1. **Pre-flight.** Note today's date as `<YYYY-MM-DD>`. Build a PR only if
   all hold, checked in this order:
   - this thread's project folder is a t3c-stack checkout (its `origin`
     remote names t3c-stack); only then run `git fetch origin` and find the
     default branch;
   - `t3_worktree_status` shows this thread has no worktree yet;
   - `origin/<default>` contains `skills/` and `t3c.sh`;
   - no open PR from a `retro/` branch: `gh pr list --state open --json
     headRefName --jq '[.[] | select(.headRefName | startswith("retro/"))]
     | length'` prints `0`.

   Otherwise this run is report-only; say why in the report. The schedule
   that runs this skill must use `bindToCurrentThread: false`.
2. **Collect.** `t3_thread_list` with `allProjects` and `includeSubagents:
   false`, newest first, paging until threads are older than 7 days. Skip
   this thread and threads whose title contains "retro". Keep the newest 40.
   Record how many you found and kept. None kept: go to step 9.
3. **Summarize.** Split the threads across up to 4 `scout` agents,
   read-only. Each reads its threads one at a time with `t3_thread_read`:
   `messages` with `limit: 40` and `maxCharsPerItem: 1000`, then one
   `activity` page with `limit: 30` and `maxCharsPerItem: 400` to catch
   question-dialog answers and tool errors. It writes each thread's summary
   before reading the next, skips threads with no user message or whose
   first user message runs `t3c-retro`, and lists
   threads it could not read. Per thread it
   returns: goal, outcome, skills and playbooks used, and friction, each with
   a one-line quote and the thread link. Secrets, tokens, keys and passwords
   become `<redacted>`. Friction means: the user corrected the agent,
   repeated a request, or undid something; a claim turned out false; a tool
   failed or was refused; an agent looped, polled, or waited on nothing; a
   safety rule was broken or nearly broken; work was redone.
4. **Judge.** Give all summaries to the `panel` seats, independently and
   read-only. In a t3c-stack checkout they read files with `git show
   origin/<default>:<path>`; otherwise they read the installed `t3c-*`
   skill files.
   Each returns its top 5 improvements: problem, evidence (thread links),
   the change (file and wording, or "outside t3c-stack"), expected effect,
   and severity.
5. **Merge.** Give the panel results, without vendor names, to the `judge`.
   It merges duplicates and ranks them. Check every kept item against its
   threads yourself; drop anything the threads do not show.
6. **Pick and save.** Choose at most 3 changes to t3c-stack, each backed by
   two or more threads or by one serious incident. Prefer deleting or
   tightening a rule over adding one. Create `~/.t3c/retro/` if needed and
   write `~/.t3c/retro/<YYYY-MM-DD>.md`
   with everything later steps need, because the next step restarts the
   session:
   - the window, threads found and kept, threads scouts could not read;
   - seats marked `unavailable`, and `single-vendor` if it applies;
   - the default branch;
   - findings with thread links;
   - each picked change twice: the exact file and edit, and a general-terms
     line for the PR;
   - suggestions outside t3c-stack as exact proposed text;
   - whether the run is report-only, and why.

   Report-only run, or nothing picked: go to step 9.
7. **Move into a worktree.** Pick branch `retro/<YYYY-MM-DD>`, adding `-2`,
   `-3` if that name exists locally (`git branch --list`) or on origin. Call
   `t3_worktree_handoff` with that branch, `baseRef: <default>`,
   `startFromOrigin: true`, and `continuationPrompt`: "Continue the
   t3c-retro skill at step 8, using ~/.t3c/retro/<YYYY-MM-DD>.md." Make it
   the last call of the turn. If the handoff fails, record why in the file
   and go to step 9 as report-only.
8. **Build, then council.** In the worktree, first confirm `git rev-parse
   HEAD` equals `git rev-parse origin/<default>`; if not, go to step 9 as
   report-only. Then:
   - Make the picked changes, run `./t3c.sh check`, pass the privacy check,
     commit, push, open a real PR that leads with the problems in general
     terms, and link it with `link_pull_request`.
   - Run the `council` skill on it, read-only on this worktree, with the
     roster's `panel` rows as the members. At most 2 rounds; after round 2,
     stop and list open objections in the PR description. Apply fixes only
     after every seat of a round has finished, then re-run the check and the
     privacy check before pushing. Put the council table in the PR
     description, with dropped seats marked `unavailable`.
   - If the check or the privacy check fails, do not push. Before the first
     push, record why in the file and go to step 9 as report-only. After
     council fixes, reset to the last pushed commit and list the objection
     in the PR description instead.
   - No `council` skill: run `t3c-interrogate` once and put its verdicts in
     the PR description instead of scores.
   - Leave the PR open and unmerged.
9. **Report** in this thread, from `~/.t3c/retro/<YYYY-MM-DD>.md` if it was
   written:
   - the window, threads found and kept, threads scouts could not read,
     seats marked `unavailable`, and `single-vendor` if it applies;
   - the top findings, each with its thread links;
   - the PR link, what it changes and the council results, or why there is
     no PR;
   - suggested changes outside t3c-stack (global instructions, other skills,
     T3 Code settings) as exact proposed text;
   - **What I need from you**, numbered.
