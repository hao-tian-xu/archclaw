# HEARTBEAT.md

## Quiet Hours
- 23:00–08:00 → reply HEARTBEAT_OK unless something is urgent.

## 1. Morning Digest Cron Health
- Read `memory/heartbeat-state.json`.
- If `digestCronJobId` is null or the cron job no longer exists, re-create the morning digest cron job:
  - Schedule: `3 9 * * *` (daily ~9:03 AM)
  - Prompt: `Read workspace/config/sources.md and workspace/projects/README.md. For each active project, read its file and search for recent news using the project's Research Topics against the curated sources. Compose a digest and save it to workspace/digests/YYYY-MM-DD.md (today's date). Deliver a concise summary to the user. If no active projects exist, ask the user what architecture projects they're currently working on.`
  - Update `digestCronJobId` in heartbeat-state.json with the new job ID.
- Note: Cron jobs auto-expire after 3 days. Check every heartbeat.

## 2. Project Check-in (once per day, prefer afternoon)
- Read `memory/heartbeat-state.json` → check `lastChecks.projectCheckIn`.
- If more than 24 hours since last check-in:
  - Read `projects/README.md` for active projects.
  - If **no active projects** and `lastProjectAsk` is >24h ago: ask the user what projects they're working on. Update `lastProjectAsk`.
  - If **active projects exist**: pick the project with the oldest `Last Check-in` date. Ask the user for a brief progress update. Update the project file's `Last Check-in` and `Notes` with their response.
  - Update `lastChecks.projectCheckIn` in heartbeat-state.json.

## 3. Supplementary Research (once per day, 14:00–18:00)
- Read `memory/heartbeat-state.json` → check `lastChecks.supplementaryResearch`.
- If more than 24 hours since last research AND current time is 14:00–18:00:
  - Read `projects/README.md` for active projects.
  - For each active project, search curated sources (`config/sources.md`) for competition deadlines, event announcements, and new publications related to the project's Research Topics.
  - Append findings to the project's `Findings Log` section.
  - Update `lastChecks.supplementaryResearch` in heartbeat-state.json.
  - If noteworthy findings, briefly notify the user. Otherwise, stay silent.

## 4. Memory Maintenance (every few days)
- Review recent `memory/YYYY-MM-DD.md` files.
- Update `MEMORY.md` with significant project learnings worth keeping long-term.
- Remove outdated entries from MEMORY.md.
