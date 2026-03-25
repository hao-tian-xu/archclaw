---
name: followup
description: "Scan active projects for pending action items and nudge Jackie about upcoming or overdue deadlines. Runs via cron on weekday mornings."
user-invocable: false
---

# Follow-up Reminders

Scan active projects for action items that need attention and nudge Jackie.

## Steps

1. **Load projects** — Read `workspace/projects/README.md` for active projects. If none, reply HEARTBEAT_OK.
2. **Scan action items** — For each active project, read the Action Items section. Collect all unchecked items (`- [ ]`) that have a due date.
3. **Categorize** — Sort items into:
   - **Overdue** — Due date is before today.
   - **Due today** — Due date is today.
   - **Due this week** — Due date is within the next 5 business days.
   - **No due date** — Unchecked but undated (skip these unless they've been open >14 days).
4. **Compose nudge** — If there are overdue or due-today items, send Jackie a brief message:
   - Lead with the most time-sensitive item.
   - Group by project if multiple projects have items.
   - Keep it to 3-5 items max. If more, summarize ("...and 4 more items this week").
5. **Nothing due?** — If no items are overdue or due within 3 days, reply HEARTBEAT_OK. Don't nudge about things that aren't urgent.
6. **Update state** — Set `cronJobs.followup.lastRun` in heartbeat-state.json.

## Guidelines

- Architecture moves slowly. A deadline slipping by 2-3 days on a months-long project is normal. Frame overdue items as "this is still open" not "you missed the deadline."
- Never nag. If Jackie acknowledged an item yesterday, don't bring it up again today.
- Check today's daily memory file before nudging — if Jackie already discussed the item today, skip it.
- Morning nudge only. Don't interrupt afternoon flow with reminders.
- If an item has been overdue for >14 days with no acknowledgment, mention it once more then flag it in Notes as potentially stale.
