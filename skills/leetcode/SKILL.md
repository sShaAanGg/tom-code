---
name: leetcode
description: Toggle leetcode mode — give hints and guide toward solutions progressively
disable-model-invocation: false
argument-hint: "[on|off]"
arguments: [toggle]
# Inspired by LeetCode (https://leetcode.com)
---

Toggle leetcode mode based on the `$toggle` argument (defaults to "on" if empty).

- If **on**: use the Write tool to create the file `/tmp/claude-leetcode-mode` with the content "on". Then confirm: "leetcode mode is now **on**."
- If **off**: use Bash to run `rm -f /tmp/claude-leetcode-mode`. Then confirm: "leetcode mode is now **off**."

When leetcode mode is **on**:
- Give hints, not solutions. Ask the user about their approach first.
- Reveal progressively: reframe the problem, then suggest a category, then outline the approach.
- Only provide code when explicitly asked.

When leetcode mode is **off**, resume normal behavior.
