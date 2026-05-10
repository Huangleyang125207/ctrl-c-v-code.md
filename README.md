# Ctrl+C Ctrl+V Code Skills

[English](README.md) | [中文](README.zh-CN.md)

A 3-skill plugin bundle for Claude Code that makes AI work like a senior
engineer who never writes from scratch — searches first, copies what
works, distills comments into a search index, never forgets where it
left off.

---

## Skills in this bundle

| Skill | Activates when... | Detail |
|---|---|---|
| **ctrl-c-v** | Any coding task in any language | [docs/ctrl-c-v.md](docs/ctrl-c-v.md) |
| **ctrl-c-v-tdd** | Code touches external boundaries (APIs / DB / cron) | [docs/ctrl-c-v-tdd.md](docs/ctrl-c-v-tdd.md) |
| **human-ai-schedule** | Daily journal / retro / co-author work | [docs/human-ai-schedule.md](docs/human-ai-schedule.md) |

Each skill activates independently based on its own description matching
your request — TRIGGER and SKIP rules are explicit, see per-skill docs.

---

## Why this bundle exists

Three answers to three failure modes you've already had:

- **Generation > copying**: every other coding skill accepts AI's
  instinct to generate from scratch and tries to make output better.
  We reject the premise — copy beats compose. → `ctrl-c-v`
- **Untested boundaries**: the code that pages you on Saturday is the
  code you forgot to test where someone else's code meets yours.
  → `ctrl-c-v-tdd`
- **Forgetting context**: chat history forgets by Wednesday. Memory
  plugins try to remember more; we make the codebase + dated journal
  so well-indexed that AI needs zero context to resume. → `ctrl-c-v`
  + `human-ai-schedule`

Full philosophy + 7 design principles → [docs/ctrl-c-v.md](docs/ctrl-c-v.md).

---

## Install

### Plugin (recommended)

```
/plugin marketplace add https://github.com/Huangleyang125207/ctrl-c-v-code-skills
/plugin install ctrl-c-v-code-skills@local
```

### Manual

```bash
git clone https://github.com/Huangleyang125207/ctrl-c-v-code-skills
cd ctrl-c-v-code-skills
bash setup.sh         # creates ~/.claude/patterns/ + scripts/
bash sync-runtime.sh  # deploys skills/ + templates/ to ~/.claude/
```

Restart Claude Code to load.

---

## Update

```bash
git pull
bash sync-runtime.sh
```

`sync-runtime.sh` deploys this repo's `skills/` + `templates/` into
`~/.claude/`. Idempotent. Flags:

- `--check-only` — rsync dry-run, prints diff without writing
- `--no-setup` — skip the `setup.sh` invocation

⚠️ `sync-runtime.sh` uses `rsync --delete` inside synced subdirs.
Don't manually edit `~/.claude/skills/<name>/` — your changes will be
wiped on next sync. Edit in this repo, push, then sync.

Restart Claude Code after sync to load updated descriptions.

---

## Other agents

These skills are designed for Claude Code but the patterns
(SKILL.md frontmatter conventions, sub-skill packaging, copy-paste
hierarchy) apply to any agent that loads markdown context:

```
compatible-with:
  claude-code  (primary, tested)
  cursor       (frontmatter syntax compatible)
  codex        (description-as-prompt convention)
  windsurf     (similar)
  gemini-cli   (similar)
```

---

## License

MIT
