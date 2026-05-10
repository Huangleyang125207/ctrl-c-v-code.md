#!/bin/bash
# timeblock-stamp.sh — UserPromptSubmit hook that injects the current local
# time-block as a system-reminder. Solves the recurring § H1 failure where
# AI guesses time-block placement instead of computing it.
#
# Output format (one line, prepended to user prompt context):
#   [time-block] now=HH:MM TZ YYYY-MM-DD(Day) → current block: H：MM (covers HH:MM-HH:MM)
#
# Time-block math (per § H1):
#   - block label = H × 60 + floor(M / 30) × 30   (NOT round)
#   - 22:59 → 22:30 block (NOT 23:00)
#   - 11:00 → 11:00 block
#   - 11:29 → 11:00 block
#   - 11:30 → 11:30 block
#
# Gating: only emits when cwd (or any ancestor) contains a schedule directory
# (`半小时复盘/` or `journal/` or `schedule/`). Other projects get no noise.
#
# Full-width colon `：` (U+FF1A) used in the block label, matching the
# template's H1 format. Half-width `:` used in the timestamps for readability.

# --- Gate: only emit in projects with a schedule directory ---
has_schedule_dir() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    for candidate in "$dir/数据库/valut/半小时复盘" "$dir/journal" "$dir/schedule"; do
      [ -d "$candidate" ] && return 0
    done
    dir=$(dirname "$dir")
  done
  return 1
}

has_schedule_dir || exit 0

# --- Compute current local time-block ---
TZ_NAME=$(date +%Z)
DATE=$(date +%Y-%m-%d)
DOW=$(date +%A)
H=$(date +%H)
M=$(date +%M)

# Floor minutes to nearest 30
FLOOR_M=$(( (10#$M / 30) * 30 ))
FLOOR_M_STR=$(printf "%02d" "$FLOOR_M")
END_M=$(( FLOOR_M + 29 ))
END_M_STR=$(printf "%02d" "$END_M")

# Strip leading zero from H for the block label (matches template: `# 9：30` not `# 09：30`)
H_LABEL=$(echo "$H" | sed 's/^0//')

cat <<EOF
[time-block] now=${H}:${M} ${TZ_NAME} ${DATE}(${DOW}) → current block: ${H_LABEL}：${FLOOR_M_STR} (covers ${H}:${FLOOR_M_STR}-${H}:${END_M_STR})
[time-block] H1 use: \`# ${H_LABEL}：${FLOOR_M_STR}\` (full-width colon). For PAST events, see § H1 decision tree.
EOF

exit 0
