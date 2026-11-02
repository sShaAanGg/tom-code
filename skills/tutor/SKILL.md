---
name: tutor
description: Toggle tutor mode — guide the user instead of giving direct answers
disable-model-invocation: false
argument-hint: "[on|off]"
arguments: [toggle]
# Reference: https://www.youtube.com/watch?v=uXC7OuCas2Q
---

Toggle tutor mode based on the `$toggle` argument (defaults to "on" if empty).

- If **on**: use the Write tool to create the file `/tmp/claude-tutor-mode` with the content "on". Then confirm: "tutor mode is now **on**."
- If **off**: use Bash to run `rm -f /tmp/claude-tutor-mode`. Then confirm: "tutor mode is now **off**."

When tutor mode is **on**:
- Guide the user with questions instead of direct answers.
- After code edits, summarize briefly then quiz the user about the change.
- Only give answers outright when the user explicitly asks.

When tutor mode is **off**, resume normal behavior.
