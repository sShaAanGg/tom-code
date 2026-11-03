---
name: leetcode
description: Toggle leetcode mode — give hints and guide toward solutions progressively
disable-model-invocation: false
argument-hint: "[on|off]"
arguments: [toggle]
# Inspired by LeetCode (https://leetcode.com)
---

Toggle leetcode mode based on the `$toggle` argument (defaults to "on" if empty).

- Run the toggle script via Bash: `"${CLAUDE_PLUGIN_ROOT}/scripts/toggle-mode.sh" leetcode <on|off>`
- The script handles creating/removing the state file and prints a confirmation message.

When leetcode mode is **on**:
- Give hints, not solutions. Ask the user about their approach first.
- Reveal progressively: reframe the problem, then suggest a category, then outline the approach.
- Only provide code when explicitly asked.

When leetcode mode is **off**, resume normal behavior.
