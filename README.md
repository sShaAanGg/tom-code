# tom-code

```
/plugin install tom-code --marketplace sShaAanGg/tom-code
```
Requires Claude Code 2.1.275+.

## Project Structure

```
tom-code/
├── .claude-plugin/
│   └── plugin.json         # Plugin manifest (name, version, author)
├── .claude/
│   └── settings.json       # Project settings (default permission mode: acceptEdits)
├── agents/
│   └── reviewer.md         # `reviewer` subagent: reviews uncommitted changes
├── commands/
│   └── status.md           # `/status` slash command: one-line repo status
├── githooks/
│   └── commit-msg          # Git hook: strips Claude Co-Authored-By trailers
├── hooks/
│   └── hooks.json          # Hook config: SessionStart (tutor on), PostToolUse on Write|Edit
├── scripts/
│   └── toggle-mode.sh      # Toggle tutor/leetcode mode via flag file in ${CLAUDE_PLUGIN_ROOT}/.state/
├── skills/
│   ├── tutor/
│   │   └── SKILL.md        # `/tutor on|off`: Socratic tutor mode
│   ├── leetcode/
│   │   └── SKILL.md        # `/leetcode on|off`: progressive hints for problems
│   ├── project-notes/
│   │   └── SKILL.md        # `project-notes` skill: summarizes git state
│   ├── changemap/
│   │   └── SKILL.md        # `/changemap [chat|md] [ref]`: annotated change summary
│   └── tracesupport/
│       └── SKILL.md        # `/tracesupport [chat|md] [ref]`: data/control flow walkthrough
├── AGENTS.md               # Project instructions (imported by CLAUDE.md)
├── CLAUDE.md               # Claude Code project instructions
└── README.md
```

## Usage

Load the plugin for one session with `--plugin-dir`, from any project directory:

```
cd /path/to/other-project
claude --plugin-dir /path/to/tom-code
```

The plugin is active only for that session. Repeat the flag to load several plugins:
`claude --plugin-dir /path/to/tom-code --plugin-dir /path/to/other-plugin`.

## Features
1. Tell the model to avoid the attribution trailer and extremely verbose commit messages to save tokens.  
    a. Prompt-only, so not guaranteed. For reliability, set `"attribution": {"commit": ""}` in `~/.claude/settings.json` yourself.  
    b. Hard guarantee for this repo: `git config core.hooksPath githooks` enables the `commit-msg` hook that deletes the trailer line.
2. **Tutor mode** (`/tutor on|off`, on by default) — Claude guides with questions instead of direct answers. After code edits, quizzes you about the change. ([Reference](https://www.youtube.com/watch?v=uXC7OuCas2Q))  
    a. PostToolUse hook fires a tutor-mode reminder after Write/Edit when tutor mode is active.  
    b. Sometimes I feel the mode is a bit too harsh to work in, but maybe it's actually helpful for learning.  
    c. This will likely cause you to spend MORE time & credits on the task, so use with caution.
3. **Leetcode mode** (`/leetcode on|off`) — Progressive hints for algorithm problems. Inspired by [LeetCode](https://leetcode.com).
4. **Commit change map** — For `feat`/`fix`/`perf` commits, the commit body includes a map of what changed: core logic vs. wiring, where to start reading.
5. **Change map** (`/changemap [chat|md] [commit-ref]`) — On-demand annotated summary of changes. Labels files as core logic, wiring/config, boilerplate, or trivial.
6. **Trace support** (`/tracesupport [chat|md] [commit-ref]`) — Walks through data/control flow with concrete examples and flow charts (ASCII in chat, Mermaid in md).
