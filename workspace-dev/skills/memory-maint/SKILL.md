<!-- ARCHCLAW:BEGIN - DO NOT MODIFY THIS SECTION -->
---
name: memory-maint
description: "Curate daily session notes into long-term MEMORY.md. Archive stale entries, consolidate themes."
user-invocable: false
---

# Memory Maintenance

Review daily notes and distill significant learnings into long-term memory.

## Steps

1. **Read recent dailies** — Read `memory/YYYY-MM-DD.md` files from the last 7 days.
2. **Read MEMORY.md** — Load the current long-term memory file.
3. **Identify keepers** — From daily notes, find:
   - Project decisions or direction changes.
   - Preferences the user expressed (materials, styles, approaches).
   - Lessons learned from research or conversations.
   - Relationships or collaborators mentioned.
4. **Update MEMORY.md** — Add distilled entries. Group by theme, not by date.
5. **Prune MEMORY.md** — Remove entries that are:
   - Superseded by newer information.
   - No longer relevant (project completed/archived, preference changed).
   - Too granular (belongs in daily notes, not long-term memory).
6. **Update state** — Set `cronJobs.memoryMaint.lastRun` in heartbeat-state.json.

## Guidelines

- MEMORY.md is curated wisdom, not a log. Keep it concise.
- Don't duplicate what's already in project files — those are the source of truth for project details.
- Preserve the user's voice when noting their preferences (use their name from `USER.md`, not "The user likes...").
- This runs silently — no need to announce to the user unless you removed something they might want back.

<!-- ARCHCLAW:END -->

## Your Additions

_Add custom steps, overrides, or notes for this skill below._
