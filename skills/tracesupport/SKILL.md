---
name: tracesupport
description: Walks through data/control flow of recent changes with concrete examples and flow charts. Use for understanding how code changes connect.
argument-hint: "[chat|md] [commit-ref]"
arguments: [format, ref]
---

Provide tracing support for code review.

**Arguments:**
- `$format`: `chat` (default) — display in conversation. `md` — output as markdown with Mermaid diagrams for PR descriptions.
- `$ref`: optional commit SHA, branch, or PR number. Defaults to uncommitted changes.

**Steps:**
1. Gather the diff (same as `/changemap`).
2. Identify the main data/control flows involved in the change.
3. For each flow, provide:
   - A concrete walkthrough with example data (e.g., "user clicks Submit -> handleSubmit() -> validateForm() -> api.post('/orders')")
   - A flow chart (ASCII for `chat`, Mermaid for `md`)
   - Notable edge cases or branching paths, if relevant
4. Keep it grounded in the actual code — reference real function names and files.
