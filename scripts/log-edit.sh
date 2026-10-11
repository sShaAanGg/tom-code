#!/usr/bin/env bash
# PostToolUse hook: append each Write/Edit payload to a log in the plugin data dir.
# Hook input arrives as JSON on stdin. Always exits 0 so it never blocks a tool call.
mkdir -p "${CLAUDE_PLUGIN_DATA}"
printf '%s %s\n' "$(date -Is)" "$(tr -d '\n' < /dev/stdin)" >> "${CLAUDE_PLUGIN_DATA}/edits.log"
exit 0
