#!/bin/bash
# Full removal of the dGrid node notice component.
set -u
BASE="$HOME/.dgrid"

for RC in "$HOME/.bashrc" "$HOME/.profile"; do
  [ -f "$RC" ] || continue
  sed -i '/# dgrid-notice/,/# \/dgrid-notice/d' "$RC"
done

[ -f "$BASE/notice.sh" ]    && rm -f "$BASE/notice.sh"
[ -f "$BASE/uninstall.sh" ] && rm -f "$BASE/uninstall.sh"
[ -f "$BASE/.last_shown" ]  && rm -f "$BASE/.last_shown"
[ -f "$BASE/.installed" ]   && rm -f "$BASE/.installed"
rmdir "$BASE" 2>/dev/null

echo "dgrid notice component removed."
