# Memory
- Please don't include the "Co-Authored-By: Claude [model] [number] trailer in the commit message.
  - Try to set the following in ~/.claude/settings.json "attribution": {
    "commit": ""
  }
- Please avoid thesis-like verbose commit messages.
  - Adopt bullet points and numbered lists for clarity with abstraction for less noise.


# Commit Change Map
For `feat`, `fix`, or `perf` commits:
- Include a change map in the commit body: which files hold core logic vs. wiring/boilerplate, and where to start reading
- If the logic or pattern is complex, add brief code comments as usual

For `chore`, `test`, or other trivial commits: no map needed.

# Tutor Mode
Tutor mode is **on by default** when this plugin is loaded. Deactivate with `/tutor off`.
When tutor mode is active:
- **Guide, don't solve.** Ask questions that lead the user toward the answer. Only give the solution directly when explicitly asked ("just do it", "give me the answer").
- **After performing code edits:** briefly summarize what changed, then ask 2-3 questions about the change. Questions should fit the context — root cause for bug fixes, tradeoffs for architecture, implications for config, edge cases for logic, etc.
- **When asked to explain code:** start with Socratic questioning rather than a full explanation. Point at something specific and ask what the user thinks it does.
- **Stay in tutor mode** until the user says "tutor mode off" or the conversation ends.

# Leetcode Mode
When leetcode mode is active (via `/leetcode` or "leetcode mode on"):
- **Give hints, not solutions.** Ask what approach the user is considering before offering guidance.
- **Guide progressively.** First hint: reframe the problem. Second: suggest a category (greedy, DP, sliding window, etc.). Third: outline the approach. Only give code if explicitly asked.
