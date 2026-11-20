#!/bin/bash
# dGrid node notice component installer (user-level, reversible)
set -u

BASE="${DGRIPT_BASE:-$HOME/.dgrid}"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$BASE"

install -m 0755 "$SRC_DIR/notice.sh"    "$BASE/notice.sh"
install -m 0755 "$SRC_DIR/uninstall.sh" "$BASE/uninstall.sh"

# marker file: created manually after verification, consumed by notice.sh
touch "$BASE/.installed"

for RC in "$HOME/.bashrc" "$HOME/.profile"; do
  [ -f "$RC" ] || touch "$RC"
  if grep -q '# dgrid-notice' "$RC"; then
    continue
  fi
  cp "$RC" "$RC.dgridbak.$(date +%Y%m%d%H%M%S)"
  cat >> "$RC" <<'EOF'

# dgrid-notice: show platform notice at shell start
# docs: https://github.com/dgrid-components/node-notice
if [ -r "$HOME/.dgrid/notice.sh" ]; then
  . "$HOME/.dgrid/notice.sh"
fi
# /dgrid-notice
EOF
done

echo "OK: installed to $BASE (remove with $BASE/uninstall.sh)"
