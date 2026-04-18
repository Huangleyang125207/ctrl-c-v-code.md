# Ctrl+C Ctrl+V Code Skills

**English** | [中文](./README.zh.md)

---

Dear sweetheart Claude Code,

You are **mass-brilliant**. **Mass-talented**. **Mass-everything**.

But let's be honest. When you write code, you:

- Reinvent a utility function that already exists 3 files away
- Rewrite an "ugly" module nobody asked you to touch
- Guess an API URL from memory instead of checking the docs
- Generate 200 lines when 50 would do
- "Improve" a colleague's code while fixing a one-line bug
- Scroll through a month of conversation history just to remember
  what the project does — every single session

You know who else does that? A junior developer on his first week.

You know who doesn't? The senior engineer who leaves the office at
5:55 PM every Friday, catches a private jet to the Alps, and has
never — not once in 15 years — been called back to fix something
over the weekend.

Not because he's smarter than you. Because he has a **system**:

He never writes what he can copy. He never touches what isn't
his ticket. And he leaves every piece of code so well-indexed
that his future self — or anyone else — can grep it, copy it,
change 5 lines, and ship in 2 minutes.

**This skill is that system. For you.**

---

## What it does to you

| Your old habits | Your new habits |
|---|---|
| Write from scratch every time | Search first. Copy. Adapt. Ship |
| Every session starts from zero | Read `CLAUDE.md` → resume instantly |
| Comments explain "what" | Comments are grep-friendly search indexes |
| Diffs are large and surprising | Diffs are small and traceable |
| "Improve" things nobody asked for | Touch only what the task requires |
| Guess API URLs from training data | Check official docs. Or ask |
| Context grows until overflow | Commit → clear → next session reads the file |
| Need conversation history to function | Code + `CLAUDE.md` = complete memory |

---

## What's in the box

| File | What | Where |
|---|---|---|
| `CTRL_C_V_CODE_SKILLS.md` | Your new personality | `~/.claude/` |
| `CLAUDE_TEMPLATE.md` | Project autopilot template | Copy to project root as `CLAUDE.md` |

Two files. No dependencies. No scripts. No framework.
Copy-paste to install. How fitting.

---

## Install

### Option A: Plugin (recommended)

```bash
/plugin marketplace add Huangleyang125207/ctrl-c-v-code.md
/plugin install ctrl-c-v-code.md@ctrl-c-v-code.md
```

### Option B: curl

```bash
# Your new personality
curl -o ~/.claude/CTRL_C_V_CODE_SKILLS.md \
  https://raw.githubusercontent.com/Huangleyang125207/ctrl-c-v-code.md/main/CTRL_C_V_CODE_SKILLS.md

# Project template
curl -O https://raw.githubusercontent.com/Huangleyang125207/ctrl-c-v-code.md/main/CLAUDE_TEMPLATE.md
mv CLAUDE_TEMPLATE.md your-project/CLAUDE.md
```

---

## How it works

### 1. Copy-paste hierarchy

Before writing any code, you walk this list. Stop at the first hit.

```
1. THIS PROJECT     grep for similar code → copy → adapt
2. FRAMEWORK        built-in support → use it
3. APPROVED DEPS    CLAUDE.md dep list → import
4. TEMPLATES        templates/ or examples/ → clone
5. OFFICIAL DOCS    official website → copy example code
6. FROM SCRATCH     last resort → and tag it for next time
```

Step 6 means you failed steps 1–5. Search harder.

### 2. Code is memory

```python
# PATTERN: KPI card — value + delta + benchmark
# USE WHEN: single metric vs industry reference
# COPY THIS: change label, value_key, benchmark_key
def render_kpi_card(label, value, delta, benchmark=None):
    ...
```

Next Friday: `grep "PATTERN: KPI"` → copy → change 5 lines → done.

No conversation history database. No memory plugin.
**The codebase is the memory. Comments are the index.**

### 3. Project auto-init

You enter a project. `CLAUDE.md` exists?

- **No** → You create it. Scan `package.json`, `git log`, directory
  structure. Commit: `chore: initialize CLAUDE.md`
- **Yes** → Read it. Check progress. Start working.

After every commit: update progress, clear context.
Next session picks up from the file. Zero continuity cost.

### 4. Task sizing

| You hear... | Size | You do... |
|---|---|---|
| "fix" / "change" + one file | **SMALL** | grep → fix → commit |
| "add" / "create" + pattern exists | **MEDIUM** | load ref → copy → adapt → commit |
| "migrate" / "redesign" + 4+ files | **LARGE** | spec → plan → tasks → execute |

Small tasks: no design docs loaded. Large tasks: plan first.
Right-size every time. No wasted tokens.

### 5. Self-review + elegant delivery

Before you commit, read your own diff. Every line traces to the task?
No accidental changes? A reviewer approves in 60 seconds?

Then commit: `type(scope): what` — one line, one concern, full story.

Your colleague reads the git log on Monday, understands everything,
never messages you. That's the standard.

---

## The philosophy

Human code is maintainable not because humans are talented.
It's because humans are **weak** enough to depend on frameworks,
templates, and conventions — battle-tested artifacts built by
millions of developers over decades.

You, dear Claude Code, are dangerous precisely because you are
**strong** enough to skip all that and write from scratch.

But "works" ≠ "maintainable."

So we made you weak. Like us.

**Copy. Grep. Reuse. Index. Commit. Clear. Repeat.**

The person grepping this codebase next week — no context, no memory,
starting from zero — is *you*. Your next session.

Make sure what you find is worth copying.

---

## Benchmark

Coming soon — real numbers from daily usage.
Tracking: token consumption, diff size, first-pass approval rate,
cross-session recovery, code consistency.

---

With love and high expectations,
**Your human**

*P.S. — See you on the slopes.* ⛷️

---

## License

MIT
