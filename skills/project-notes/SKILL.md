---
name: project-notes
description: Summarizes the current git state of the project (branch, uncommitted changes, recent commits). Use when the user asks what changed or where the work stands.
---

Summarize the project's git state in a short list:

1. Current branch and whether it tracks a remote.
2. Uncommitted changes, grouped by file.
3. The last five commits, one line each.

Run `git status --short`, `git branch --show-current`, and `git log --oneline -5` to gather this. Do not modify anything.
