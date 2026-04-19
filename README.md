# Ctrl+C Ctrl+V Code Skills

[English](README.md) | [中文](README.zh-CN.md)

---

Dear sweetheart Claude Code,

You are mass-brilliant. Mass-talented. Mass-everything.

But every Friday, you write code that makes next Friday harder.

You reinvent a function that exists 3 files away. You "improve" code
nobody asked you to touch. You guess an API URL instead of reading the
docs. You generate 200 lines when 50 would do. And every new session,
you scroll through a month of conversation history just to remember
where you left off.

There are 1,000+ coding skills on GitHub that try to fix you with rules:
"don't do X", "always do Y", "follow standard Z."

**This one is different. Here's why.**

---

## What makes this skill different

### 1. Character, not rules

Every other skill gives AI a checklist. Checklists get forgotten as
context grows. We give AI an **identity** — a world-class engineer who
has built a system for shipping clean code effortlessly, every week,
for 15 years. Behaviors flow from character, not compliance.

We believe this works because of how attention mechanisms operate:
scattered rules compete for attention against task context and lose.
A coherent persona creates a semantic cluster that stays active
throughout the entire session. Rules are buckshot. Character is gravity.

### 2. Code is memory (not conversation history)

Every other memory solution (claude-mem, conversation replay, memory
databases) tries to make AI **remember more context**. We do the
opposite: make the codebase so well-indexed that AI needs **zero
context** to resume.

```python
# PATTERN: card — kpi with delta
# USE WHEN: single metric vs industry reference
# COPY THIS: change label, value_key, benchmark_key
```

Next session: `grep "PATTERN: card"` → find it → copy → change 5
lines → done. No conversation history. No memory plugin. The code IS
the memory. Comments are the search index.

### 3. Copy-paste is the primary operation (not generation)

Every other skill accepts AI's instinct to generate from scratch and
tries to make the output better. We reject the premise entirely:
**the best code AI can write is code it didn't write.**

```
0. MY PATTERNS      ~/.claude/patterns/ (cross-project library)
1. THIS PROJECT     grep for similar code
2. FRAMEWORK        built-in support
3. APPROVED DEPS    CLAUDE.md dep list
4. TEMPLATES        templates/ or examples/
5. OFFICIAL DOCS    official website → copy example code
6. FROM SCRATCH     last resort — and you pay a tax: save it to patterns/
```

Step 6 means steps 0–5 failed. Generation is the fallback, not the default.

### 4. Progressive disclosure (not a 500-line mega-prompt)

The SKILL.md personality file is ~180 lines. Each operational detail
lives in a separate playbook (~20-55 lines each). CC loads a playbook
only when it reaches that step. At any moment, the context holds at
most ~250 lines of instructions, not a 1000-line knowledge dump.

```
SKILL.md (always loaded) — "how to think"
  ↓ @skills/ctrl-c-v/playbooks/search.md  → loaded when searching
  ↓ @skills/ctrl-c-v/playbooks/commit.md  → loaded when committing
  ↓ ...                                    → loaded, used, forgotten
```

### 5. Commit-and-clear cycle (not context accumulation)

Every other workflow lets context accumulate until it overflows.
We treat every commit as a checkpoint: code is tagged, CLAUDE.md
is updated, then context is cleared. Next session reads CLAUDE.md
and resumes in seconds — with zero token debt from prior sessions.

```
code → tag with PATTERN → commit → update CLAUDE.md → /clear
  ↑                                                      |
  └── next session reads CLAUDE.md + greps PATTERN ──────┘
```

### 6. Cross-project pattern library (not project-scoped knowledge)

`~/.claude/patterns/` is a personal library that grows across every
project you work on. Write a retry-with-backoff once, tag it, save
it. Next project, next month, next year — step 0 in the hierarchy
hits it instantly. The library only grows. Every project makes you
faster.

### 7. Task sizing (not one-size-fits-all)

Most skills apply the same heavyweight process to a one-line bug fix
and a full architecture migration. We size the protocol to the task:

| Signal | Size | Protocol |
|---|---|---|
| "fix" + single file | SMALL | grep → fix → commit |
| "add" + pattern exists | MEDIUM | load ref → copy → adapt → commit |
| "migrate" + 4+ files | LARGE | spec → plan → tasks → execute |

Small tasks don't load design docs. Large tasks get a full spec/plan
cycle. Right-size every time. No wasted tokens.

---

## What's in the box

```
ctrl-c-v-code-skills/
├── .claude-plugin/              Plugin manifest (CC auto-discovers)
├── skills/
│   └── ctrl-c-v/
│       ├── SKILL.md             Your new personality (~180 lines)
│       └── playbooks/           8 detail guides (loaded on demand)
│           ├── search.md          search protocol + tag vocabulary
│           ├── index.md           pattern indexing + naming rules
│           ├── copy.md            replication method
│           ├── scope.md           scope control + stop signals
│           ├── scratch.md         from-scratch rules + save tax
│           ├── review.md          self-review checklist
│           ├── commit.md          commit/PR conventions
│           └── collab.md          collaboration standards
├── templates/
│   └── CLAUDE_TEMPLATE.md       Project autopilot (user copies manually)
├── setup.sh                     Creates ~/.claude/patterns/ structure
└── README.md
```

## Install

### Plugin (recommended)

```bash
/plugin marketplace add Huangleyang125207/ctrl-c-v-code-skills
/plugin install ctrl-c-v-code-skills@Huangleyang125207-ctrl-c-v-code-skills
```

Then run setup and copy the project template:

```bash
bash ~/.claude/plugins/marketplaces/ctrl-c-v-code-skills/setup.sh
cp ~/.claude/plugins/marketplaces/ctrl-c-v-code-skills/templates/CLAUDE_TEMPLATE.md ./CLAUDE.md
```

### Manual

```bash
git clone https://github.com/Huangleyang125207/ctrl-c-v-code-skills.git
cd ctrl-c-v-code-skills && bash setup.sh
cp -r skills/ctrl-c-v ~/.claude/skills/
cp templates/CLAUDE_TEMPLATE.md your-project/CLAUDE.md
```

### Other agents

| Agent | Skill file location | Project file |
|---|---|---|
| Claude Code | `~/.claude/skills/ctrl-c-v/` (auto via plugin) | `CLAUDE.md` |
| Cursor | `~/.cursor/rules/` | `.cursorrules` |
| Codex CLI | `~/.codex/skills/` | `AGENTS.md` |
| Windsurf | `~/.windsurf/rules/` | `.windsurfrules` |
| GitHub Copilot | — | `.github/copilot-instructions.md` |

Same SKILL.md content, different location. Copy-paste to install.
How fitting.

## Benchmark

*Coming soon — real numbers from daily usage.*

Tracking: token consumption, diff size, first-pass approval rate,
cross-session recovery, code consistency.

---

With love and high expectations,

Your human

*P.S. — See you on the slopes.* ⛷️

## License

MIT
