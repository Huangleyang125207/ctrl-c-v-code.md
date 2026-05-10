#!/bin/bash
# sync-runtime.sh — deploy this repo's skills + templates to ~/.claude/
# Run after `git pull` to update your local skill installation.
#
# WARNING: --delete removes orphan files inside synced subdirs.
#          Don't manually edit ~/.claude/skills/<name>/ — changes get wiped.
#
# Flags:
#   --check-only   rsync dry-run, prints diff without writing
#   --no-setup     skip ./setup.sh invocation
#
# Typical workflow:
#   git pull && bash sync-runtime.sh
#   # restart Claude Code session to pick up new skill descriptions

set -e

REPO="$(cd "$(dirname "$0")" && pwd)"
RUNTIME="$HOME/.claude/skills"
TEMPLATES="$HOME/.claude/templates"

DRY=""
RUN_SETUP=1
for arg in "$@"; do
  case "$arg" in
    --check-only) DRY="-n" ;;
    --no-setup)   RUN_SETUP=0 ;;
    *) echo "unknown flag: $arg" ; exit 1 ;;
  esac
done

cd "$REPO"
echo "Deploying $REPO → \$HOME/.claude/${DRY:+ (dry-run)}..."

mkdir -p "$RUNTIME"
for skill_dir in skills/*/; do
  name=$(basename "$skill_dir")
  echo "  → skills/$name"
  rsync -a --delete $DRY "$skill_dir" "$RUNTIME/$name/"
done

if [ -d ./templates ]; then
  echo "  → templates/"
  mkdir -p "$TEMPLATES"
  rsync -a --delete $DRY ./templates/ "$TEMPLATES/"
fi

if [ "$RUN_SETUP" = "1" ] && [ -x ./setup.sh ]; then
  echo "  → setup.sh"
  bash ./setup.sh >/dev/null
fi

echo "✓ done${DRY:+ (dry-run, no changes written)}. Restart Claude Code to load updates."
