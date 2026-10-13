# tom-code

<!-- TODO: add the install line once a marketplace exists, e.g.
     /plugin install tom-helper --marketplace <owner>/<repo>
     (needs Claude Code 2.1.275+; `claude plugin validate` suggests this) -->

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
├── hooks/
│   └── hooks.json          # Hook config: PostToolUse on Write|Edit
├── scripts/
│   └── log-edit.sh         # Hook script: logs each Write/Edit payload
├── skills/
│   └── project-notes/
│       └── SKILL.md        # `project-notes` skill: summarizes git state
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
1. Disable the attribution trailer in the commit message to save tokens.
  - Not stable. Sometimes the model still append the trail message 
3. 
