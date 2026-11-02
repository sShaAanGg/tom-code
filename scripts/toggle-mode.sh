#!/usr/bin/env bash
# Toggle a mode on/off via a tmp file.
# Usage: toggle-mode.sh <mode-name> [on|off]

MODE="$1"
TOGGLE="${2:-on}"
FLAG="/tmp/claude-${MODE}-mode"

case "$TOGGLE" in
  on)
    touch "$FLAG"
    echo "${MODE} mode is now **on**."
    ;;
  off)
    rm -f "$FLAG"
    echo "${MODE} mode is now **off**."
    ;;
  *)
    echo "Usage: toggle-mode.sh <mode> [on|off]"
    exit 1
    ;;
esac
