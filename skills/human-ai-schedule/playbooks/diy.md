# Playbook: DIY the schedule template

> Loaded when user says "add a section to my daily template" /
> "I want my daily file to start with X" / "make the template my own."

## What's customizable

`templates/SCHEDULE_TEMPLATE.md` has three regions:

```
1. Top section          ← free slot, your stuff goes here
2. Format-comment block  ← reference, optional to keep
3. Time-block grid       ← do not customize per-cell here, this is the skeleton
```

You own (1). The skill defines (3). (2) is documentation.

## Common top-section additions

- Daily supplement / medication checklist
- Morning standup template (3 questions)
- Daily commitments / "today's must-do"
- Weather / mood / energy log
- Yesterday's open loops (carryover)
- Wake/sleep timestamp markers

Anything that's the SAME shape every day belongs in the template.
Anything that's different per day belongs in a time-block.

## How to add a section

Edit `templates/SCHEDULE_TEMPLATE.md` once:

```markdown
# 每日补剂打卡

- [ ] 鱼油
- [ ] 维生素 D3

---

# Morning standup

- 昨天:
- 今天:
- 卡点:

---

<!-- format-conventions block stays here, or delete -->

# 7：30
##
---
...
```

From now on, every new daily file starts with these sections.

## How to remove the format-comment block

Once you're confident in the conventions, delete the entire `<!--
FORMAT CONVENTIONS ... -->` block. The conventions still apply (skill
enforces them); the inline reference is just a teaching aid.

## How to change the time grid (rare)

Don't add cells per-day. If you need different time granularity (15-min
instead of 30-min, or 5am-9pm instead of 7am-11pm), edit the template
once. The whole project will pick up the new grid for future days.

Existing daily files don't auto-update — that's intentional, since
historical data shouldn't be retroactively re-bucketed.

## When the template stops being enough

If different projects need different top sections, fork: keep the
canonical template here, copy + customize per-project. Override path
by setting a project-level template at `<project>/templates/SCHEDULE_TEMPLATE.md`
and have project CLAUDE.md document the override.

(Most users won't hit this — one template suffices.)
