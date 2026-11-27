---
name: t3c-verify
description: Prove a change works with the most direct evidence available - reproduction, checks, the running app, a screen. Use when the user says "verify" or "prove it", and before any change is called done.
---

# t3c verify

Proof is evidence you saw in this session. Use the most direct kind the
change allows.

## Pick the method

| Change | Proof |
|---|---|
| Bug fix | The original reproduction fails before and passes after |
| Logic | The repo's checks, plus a run of the changed path |
| UI | Run the app and look: the simulator for iOS, screenshots, or T3 Code preview tools when the user asked for browser checks or invoked a skill that grants them. Close any preview tab you opened |
| Service or config | Hit the running service, read its logs or metrics |
| Infra | Read the live resource after the change |
| Docs or prompts | Read the rendered result; run any command it shows |

A green mocked test does not prove a user-facing change. A compile is not
runtime proof.

## Steps

1. **List each change** in the diff.
2. **Pick a method per change** from the table.
3. **Run it** and keep the output: the command and the lines that matter,
   or the screenshot path.
4. **If you cannot prove a change,** say so plainly and say what would
   prove it. Do not call it done.
5. **Report** a short table: change, method, evidence.

Rules from the repo or the user about how to test still apply. Do not add
new test files unless the user asked, approved, or invoked `t3c-tdd`.
