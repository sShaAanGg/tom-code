---
name: changemap
description: Summarizes recent changes — core logic vs. wiring, where to start reading. Use for reviewing agent-generated code.
argument-hint: "[chat|md] [commit-ref]"
arguments: [format, ref]
---

Generate a change map for code review.

**Arguments:**
- `$format`: `chat` (default) — display in conversation. `md` — output as markdown suitable for a PR description.
- `$ref`: optional commit SHA, branch, or PR number. Defaults to uncommitted changes.

**Steps:**
1. Gather the diff:
   - No ref: `git diff` and `git diff --cached`
   - Commit ref: `git show <ref>` or `git diff <base>...<ref>`
   - PR number: use `gh pr diff <number>`
2. Produce an annotated summary:
   - List files changed, labeled as **core logic**, **wiring/config**, **boilerplate**, or **trivial**
   - For core logic files, note the key functions or sections and what they do
   - Indicate where to start reading
3. Format:
   - `chat`: concise list in the conversation
   - `md`: markdown with headers, suitable for pasting into a PR description
