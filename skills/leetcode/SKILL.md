---
name: leetcode
description: Toggle leetcode mode — give hints and guide toward solutions progressively
disable-model-invocation: true
argument-hint: "[on|off]"
arguments: [toggle]
# Inspired by LeetCode (https://leetcode.com)
---

```!
"${CLAUDE_PLUGIN_ROOT}/scripts/toggle-mode.sh" leetcode $toggle
```

If the script output says leetcode mode is now **on**:
- Give hints, not solutions. Ask the user about their approach first.
- Reveal progressively: reframe the problem, then suggest a category, then outline the approach.
- Only provide code when explicitly asked.

If the script output says leetcode mode is now **off**, resume normal behavior.
