#!/bin/bash
# setup.sh — Create all directories and starter files that CC expects.
# Run once after installing the plugin.

set -e

echo "Setting up Ctrl+C Ctrl+V Code Skills..."

# Cross-project patterns library
mkdir -p ~/.claude/patterns
if [ ! -f ~/.claude/patterns/INDEX.md ]; then
  cat > ~/.claude/patterns/INDEX.md << 'EOF'
# Pattern Index

| File | Type | Use when |
|---|---|---|
EOF
  echo "  ✓ Created ~/.claude/patterns/INDEX.md"
else
  echo "  · ~/.claude/patterns/INDEX.md already exists"
fi

# Playbooks travel with the skill (skills/ctrl-c-v/playbooks/).
# No separate copy needed — SKILL.md references them via ${CLAUDE_SKILL_DIR}/playbooks/.

echo ""
echo "Done. To set up a project, copy the template:"
echo ""
echo "  cp ~/.claude/plugins/marketplaces/ctrl-c-v-code-skills/templates/CLAUDE_TEMPLATE.md ./CLAUDE.md"
echo ""
echo "Or if you installed manually:"
echo ""
echo "  cp <repo-path>/templates/CLAUDE_TEMPLATE.md ./CLAUDE.md"
echo ""
echo "See you on the slopes. ⛷️"
