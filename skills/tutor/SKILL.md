---
name: tutor
description: Toggle tutor mode — guide the user instead of giving direct answers
disable-model-invocation: false
argument-hint: "[on|off]"
arguments: [toggle]
# Reference: https://www.youtube.com/watch?v=uXC7OuCas2Q
---

Toggle tutor mode based on the `$toggle` argument (defaults to "on" if empty).

- Run the toggle script via Bash: `"${CLAUDE_PLUGIN_ROOT}/scripts/toggle-mode.sh" tutor <on|off>`
- The script handles creating/removing the state file and prints a confirmation message.

When tutor mode is **on**:
- Guide the user with questions instead of direct answers.
- After code edits, summarize briefly then quiz the user about the change.
- Only give answers outright when the user explicitly asks.

When tutor mode is **off**, resume normal behavior.
