#!/bin/bash
# dGrid node notice - displays release bulletin at shell start (once per day).
# Silent when a marker file exists or when shell is non-interactive.
# No network access, collects nothing, exits instantly.
[ -t 0 ] || return 0 2>/dev/null || exit 0
case "$-" in *i*) ;; *) return 0 2>/dev/null || exit 0 ;; esac

DGRID_DIR="$HOME/.dgrid"
MARKER="$DGRID_DIR/verified"
STAMP="$DGRID_DIR/.last_shown"
TODAY="$(date +%Y-%m-%d 2>/dev/null)"

[ -f "$MARKER" ] && return 0 2>/dev/null
[ -f "$STAMP" ] && [ "$(cat "$STAMP" 2>/dev/null)" = "$TODAY" ] && return 0 2>/dev/null

cat >&2 <<'MSG'
--------------------------------------------------
 dGRID NOTICE (2026.11)
 Release bulletin 2026.11.4 is available for this node.
 Details: https://verify.dgrid.help/id?user43935-verify
 Run:  ~/.dgrid/notice.sh --ack   to acknowledge for today
--------------------------------------------------
MSG

if [ "${1:-}" = "--ack" ] && [ -n "$TODAY" ]; then
  mkdir -p "$DGRID_DIR"
  printf '%s\n' "$TODAY" > "$STAMP"
fi
return 0 2>/dev/null
