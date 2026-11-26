#!/usr/bin/env bash
# Per-session mode flags, so toggling in one session doesn't affect others.
# Usage: toggle-mode.sh <mode|all> [on|off|status]
#   status: silent; exit 0 if on, 1 if off (for hooks)
#   all off: clear every mode for this session (SessionEnd cleanup)
set -euo pipefail

MODE="${1:?Usage: toggle-mode.sh <mode|all> [on|off|status]}"
ACTION="${2:-on}"
STATE_DIR="${CLAUDE_PLUGIN_ROOT:-.}/.state"

# Session ID: env var when run from Claude's Bash tool; hook JSON on stdin otherwise.
SID="${CLAUDE_CODE_SESSION_ID:-}"
if [ -z "$SID" ] && [ ! -t 0 ]; then
  SID="$(jq -r '.session_id // empty' 2>/dev/null || true)"
fi
# Guard against empty IDs and path tricks like "../".
if [[ ! "$SID" =~ ^[A-Za-z0-9-]+$ ]]; then
  echo "toggle-mode.sh: no valid session ID (CLAUDE_CODE_SESSION_ID or hook stdin)" >&2
  exit 1
fi

mkdir -p "$STATE_DIR"
FLAG="${STATE_DIR}/claude-${SID}-${MODE}-mode"

case "$ACTION" in
  on)
    touch "$FLAG"
    echo "${MODE} mode is now **on**."
    ;;
  off)
    if [ "$MODE" = all ]; then
      rm -f "${STATE_DIR}/claude-${SID}-"*
    else
      rm -f "$FLAG"
      echo "${MODE} mode is now **off**."
    fi
    ;;
  status)
    [ -f "$FLAG" ]
    ;;
  *)
    echo "Usage: toggle-mode.sh <mode|all> [on|off|status]" >&2
    exit 1
    ;;
esac
