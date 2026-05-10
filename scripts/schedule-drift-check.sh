#!/bin/bash
# schedule-drift-check.sh — Stop hook that reminds AI to reconcile schedule
# artifacts (aggregate page + PULSE.md) on weekly trigger days.
#
# Behavior:
#   - Fires only on configured days of week (default: Mon + Fri).
#   - Once per day max (marker file in /tmp).
#   - Reports drift to stdout — Claude Code reads it as a system message
#     so the AI can act on the next turn.
#   - Silent on healthy state (no drift = no output).
#
# Three drift classes, three autonomy levels:
#   1. Aggregate page out of sync   → AI auto-fixes (mechanical sync)
#   2. PULSE.md stale > 7d          → AI proposes, user confirms
#   3. PULSE.md absent + >7 files   → AI proposes creation
#
# Configuration:
TRIGGER_DAYS="1,5"   # 1=Mon ... 7=Sun. Comma-separated. "1,5" = Mon+Fri.
STALE_DAYS=7         # PULSE.md older than this triggers refresh prompt.
MIN_FILES_FOR_PULSE=7  # Schedule file count threshold for PULSE creation.

# --- Day-of-week gate ---
TODAY_DOW=$(date +%u)
case ",$TRIGGER_DAYS," in
  *",$TODAY_DOW,"*) ;;
  *) exit 0 ;;
esac

# --- Once-per-day gate ---
MARK="/tmp/.schedule-drift-fired-$(date +%Y%m%d)"
[ -f "$MARK" ] && exit 0

# --- Find a project root with schedule files ---
# Heuristic: walk up from cwd looking for a `数据库/valut/半小时复盘/` or
# `journal/` directory. If not found, exit silently.
find_schedule_dir() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    for candidate in "$dir/数据库/valut/半小时复盘" "$dir/journal" "$dir/schedule"; do
      [ -d "$candidate" ] && echo "$candidate" && return 0
    done
    dir=$(dirname "$dir")
  done
  return 1
}

SCHEDULE_DIR=$(find_schedule_dir) || exit 0
PROJECT_ROOT=$(dirname "$(dirname "$(dirname "$SCHEDULE_DIR")")")

# --- Drift checks ---
REPORTS=()

# Check 1: PULSE.md staleness across active sub-projects
while IFS= read -r pulse; do
  refreshed=$(grep -m1 "Last refreshed:" "$pulse" 2>/dev/null | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')
  [ -z "$refreshed" ] && continue
  age=$(( ($(date +%s) - $(date -j -f "%Y-%m-%d" "$refreshed" +%s 2>/dev/null || echo 0)) / 86400 ))
  if [ "$age" -gt "$STALE_DAYS" ]; then
    rel=${pulse#$PROJECT_ROOT/}
    REPORTS+=("- \`$rel\` last refreshed $age days ago — propose § H9 refresh")
  fi
done < <(find "$PROJECT_ROOT" -maxdepth 4 -name "PULSE.md" -not -path "*/node_modules/*" 2>/dev/null)

# Check 2: PULSE absence in projects with sufficient schedule volume
file_count=$(find "$SCHEDULE_DIR" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$file_count" -gt "$MIN_FILES_FOR_PULSE" ] && [ ! -f "$PROJECT_ROOT/PULSE.md" ]; then
  REPORTS+=("- Project root \`$PROJECT_ROOT\` has $file_count schedule files but no PULSE.md — propose creation")
fi

# Check 3: Aggregate page row count vs project-tagged paragraphs in last 7d
# Lightweight heuristic: count #project-style tags in recent schedule files,
# count rows in aggregate page; if delta > 0 → drift.
AGG="$PROJECT_ROOT/数据库/valut/标签聚合.md"
if [ -f "$AGG" ]; then
  recent_tags=$(find "$SCHEDULE_DIR" -name "*.md" -newermt "-7 days" -exec grep -hoE '#[A-Za-z][A-Za-z0-9_-]+' {} \; 2>/dev/null | grep -vE '^#(协作|commit|exercise|leisure|diet|饮食|运动)' | sort -u | wc -l | tr -d ' ')
  agg_sections=$(grep -cE '^## #' "$AGG" 2>/dev/null || echo 0)
  if [ "$recent_tags" -gt 0 ] && [ "$agg_sections" -lt "$recent_tags" ]; then
    REPORTS+=("- Aggregate page has $agg_sections project sections but $recent_tags distinct project-tags in last 7d entries — likely drift, run § H7 audit")
  fi
fi

# --- Emit ---
if [ ${#REPORTS[@]} -eq 0 ]; then
  touch "$MARK"
  exit 0
fi

touch "$MARK"

cat <<EOF
[schedule-drift-check] $(date +%A) reminder — schedule artifacts may have drifted:

$(printf '%s\n' "${REPORTS[@]}")

Per § H9 protocol:
- Aggregate page drift → fix automatically (no need to ask)
- PULSE refresh / creation → propose to user, list § H9 ASK-user questions, wait for confirmation
EOF

exit 0
