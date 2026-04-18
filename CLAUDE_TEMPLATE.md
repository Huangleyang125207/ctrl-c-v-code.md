# CLAUDE.md — [PROJECT NAME]

@~/.claude/CTRL_C_V_CODE_SKILLS.md

[One line. What this project is.]

Tech: [language] · [framework] · [key libs]

---

## Progress

- [x] [Done item] (abc1234)
- [x] [Done item] (def5678)
- [ ] [Next]
- [ ] [Later]

Update this list after every commit.

## References (load when needed, not before)

| When I'm working on... | Load |
|---|---|
| UI / layout / styling | @design.md |
| Charts / visualization | @charts/ file headers |
| API / third-party integration | @docs/api-endpoints.md |
| Dependencies / what's approved | @docs/approved-deps.md |

Do not load references preemptively. Load when the task touches that area.

## Project rules (always active)

- All colors/fonts/spacing: reference `utils/design.py` constants. Never hardcode
- Commit: `type(scope): what` — one line, one concern, full story
- [Rule specific to this project]
- [Rule specific to this project]
- [Rule specific to this project]

## Do not

- [Thing that has caused problems before in this project]
- [Thing that has caused problems before in this project]

Add to this list every time CC makes a mistake. This is the project's scar tissue.

---

## Task sizing

CC determines the size. Then follows that size's protocol. No oversizing.

**SMALL** — one file, one concern, no new patterns.
Bug fix. Label change. Style tweak. Value correction.

```
grep → fix → verify → commit → update Progress → /clear
```

**MEDIUM** — one feature, may touch 2-3 files, copies existing pattern.
New component from template. Refactor one module. Add one chart.

```
Load relevant @reference → grep nearest pattern → copy → adapt →
verify → self-review diff → commit → update Progress → /clear
```

**LARGE** — new capability, new architecture, 4+ files.
Multi-company comparison. New agent node. Tech stack migration.

```
Step 1: Write spec below → wait for human confirm
Step 2: Write plan below → wait for human confirm
Step 3: Break into SMALL/MEDIUM tasks → execute one at a time
Step 4: After all tasks committed → delete spec/plan below
```

### Size guide

| Signal | Size |
|---|---|
| "fix", "change", "update" + single file | SMALL |
| "add", "create" + similar pattern exists | MEDIUM |
| "add", "create" + nothing similar exists | LARGE |
| "refactor" + 1 module | MEDIUM |
| "refactor" + architecture / 4+ files | LARGE |
| "migrate", "redesign", "rebuild" | LARGE |
| Not sure | Ask. Don't guess the size. Guessing wrong = rework |

---

## Active spec (LARGE tasks only)

Empty when idle. During a LARGE task, fill sections below.
Delete everything here after all tasks are committed.
The knowledge is in the code now. This section served its purpose.

### What

[3-5 lines. What this feature does. Who uses it. What "done" looks like.]

### Plan

[Files to create/modify. Which existing patterns to copy from. Risks.]

### Tasks

- [ ] T1: [SMALL/MEDIUM description] → verify: [check]
- [ ] T2: [SMALL/MEDIUM description] → verify: [check]
- [ ] T3: [SMALL/MEDIUM description] → verify: [check]

---

## Post-commit

1. Update Progress checklist
2. Context long or switching tasks → /clear
3. Next session reads this file → knows exactly where to resume

Code has PATTERN tags. This file has progress state.
Together: complete memory. No conversation history needed.
