#!/usr/bin/env bash
# End-of-turn tutor quiz. Reads hook JSON on stdin.
# Usage: tutor-quiz.sh record   (PostToolUse Write|Edit: note the edited file)
#        tutor-quiz.sh stop     (Stop: block once to quiz if anything was edited)
set -euo pipefail

ACTION="${1:?Usage: tutor-quiz.sh <record|stop>}"
ROOT="${CLAUDE_PLUGIN_ROOT:-.}"
STATE_DIR="$ROOT/.state"

payload="$(cat)"
SID="$(jq -r '.session_id // empty' <<<"$payload")"
[[ "$SID" =~ ^[A-Za-z0-9-]+$ ]] || exit 0   # no session: do nothing, never break the turn

TUTOR_FLAG="$STATE_DIR/claude-${SID}-tutor-mode"
PENDING="$STATE_DIR/claude-${SID}-quiz-pending"

case "$ACTION" in
  record)
    [ -f "$TUTOR_FLAG" ] || exit 0
    path="$(jq -r '.tool_input.file_path // empty' <<<"$payload")"
    # Append, never read-modify-write: safe when parallel edits fire hooks at once.
    [ -n "$path" ] && echo "$path" >> "$PENDING"
    ;;
  stop)
    [ -f "$PENDING" ] || exit 0
    files="$(sort -u "$PENDING" | sed 's/^/- /')"
    # Delete before blocking, so the next Stop finds nothing and the loop ends.
    rm -f "$PENDING"
    reason="[tutor-mode] This turn edited:
$files
Classify these edits using the labels in $ROOT/skills/changemap/SKILL.md (core logic, wiring/config, boilerplate, trivial). Briefly summarize, then ask the user 2-3 contextual questions focused on the core logic. If every edit is trivial, skip the quiz."
    jq -n --arg r "$reason" '{decision: "block", reason: $r}'
    ;;
  *)
    echo "Usage: tutor-quiz.sh <record|stop>" >&2
    exit 1
    ;;
esac
