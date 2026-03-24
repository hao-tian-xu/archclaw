# HEARTBEAT.md

## Quiet Hours
- 23:00–08:00 → reply HEARTBEAT_OK unless something is urgent.

## Cron Job Health

On each heartbeat, read `memory/heartbeat-state.json` and verify that all cron jobs exist. Cron jobs auto-expire after 3 days — recreate any that are missing.

| Function | Skill | Schedule | Model | Thinking | Announce |
|----------|-------|----------|-------|----------|----------|
| Morning Digest | `/digest` | `3 9 * * *` | opus | medium | Yes |
| Project Check-in | `/checkin` | `0 15 * * 1-5` | sonnet | low | Yes |
| Supplementary Research | `/research` | `0 16 * * 1-5` | sonnet | medium | Yes |
| Memory Maintenance | `memory-maint` | `0 22 * * 0,3` | haiku | low | No |

For each row:
1. Check if `cronJobs.{name}.id` in heartbeat-state.json is non-null and the job still exists.
2. If missing, recreate the cron job with the schedule and settings above. The cron prompt should invoke the corresponding skill.
3. Update `cronJobs.{name}.id` with the new job ID.

If all jobs are healthy and nothing else needs attention, reply HEARTBEAT_OK.

## Edge Cases
- If a cron fires during quiet hours, defer the action to the next appropriate window.
- If a skill fails (e.g., no active projects for `/digest`), log the issue in today's daily memory file but don't alert Jackie unless it's persistent (3+ consecutive failures).
