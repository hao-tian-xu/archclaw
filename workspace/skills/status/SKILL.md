---
name: status
description: "Generate a concise overview of all active projects: phase, last check-in, pending action items, next milestones. Invoke with /status."
---

# Project Status Dashboard

Give Jackie a snapshot of where all her projects stand.

## Steps

1. **Load projects** — Read `workspace/projects/README.md`. Collect all active and on-hold projects.
2. **Read each project file** — For each project, extract:
   - Phase
   - Last Check-in date
   - Key Dates (next upcoming milestone)
   - Open Action Items (count + most urgent)
   - Last entry in Notes (for recent context)
3. **Format dashboard** — Present as a concise summary. For each project:
   - **{Project Name}** — {phase}
   - Last check-in: {date} ({N days ago})
   - Next milestone: {milestone} ({date})
   - Action items: {count open} ({most urgent item if overdue})
4. **Flag concerns** — After the list, add a brief "Attention" section if:
   - Any project hasn't been checked in for >14 days.
   - Any action items are overdue.
   - Any milestone is within 7 days.
5. **On-hold projects** — List on-hold projects separately with just name and reason if known. Don't give them the full treatment.

## Guidelines

- Keep it scannable. This is a dashboard, not a report.
- Don't include completed/archived projects unless Jackie asks.
- If there's only one active project, still use the dashboard format for consistency.
- Adapt to the platform: in Discord/WhatsApp, use bullet lists instead of tables. In main session, tables are fine.
