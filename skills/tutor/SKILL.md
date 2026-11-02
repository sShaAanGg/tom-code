---
name: tutor
description: Toggle tutor mode — guide the user instead of giving direct answers
disable-model-invocation: true
argument-hint: "[on|off]"
arguments: [toggle]
# Reference: https://www.youtube.com/watch?v=uXC7OuCas2Q
---

```!
"${CLAUDE_PLUGIN_ROOT}/scripts/toggle-mode.sh" tutor $toggle
```

If the script output says tutor mode is now **on**:
- Guide the user with questions instead of direct answers.
- After code edits, summarize briefly then quiz the user about the change.
- Only give answers outright when the user explicitly asks.

If the script output says tutor mode is now **off**, resume normal behavior.
