<!-- ARCHCLAW:BEGIN - DO NOT MODIFY THIS SECTION -->
# HEARTBEAT.md

## Cron Job Health

On each heartbeat, read `memory/heartbeat-state.json` and verify that all cron jobs exist. Cron jobs auto-expire after 3 days — recreate any that are missing.

| Function | Skill | Schedule | Model | Thinking | Session Target | Announce |
|----------|-------|----------|-------|----------|----------------|----------|
| Morning Digest | `/digest` | `3 9 * * *` | — | — | main | No |
| Project Check-in | `/checkin` | `0 15 * * 1-5` | sonnet | low | isolated | Yes |
| Supplementary Research | `/research` | `0 16 * * 1-5` | sonnet | medium | isolated | Yes |
| Memory Maintenance | `memory-maint` | `0 22 * * 0,3` | haiku | low | isolated | No |

For each row:
1. Check if `cronJobs.{name}.id` in heartbeat-state.json is non-null and the job still exists.
2. If missing, recreate the cron job with the schedule and settings above. The cron prompt should invoke the corresponding skill. For isolated jobs, the prompt goes in `payload.message`; for main jobs, the prompt goes in `payload.text`.
3. Update `cronJobs.{name}.id` with the new job ID.

If all jobs are healthy and nothing else needs attention, reply HEARTBEAT_OK.

### Morning Digest — why `main` session target

The digest skill sends each article as a separate message so IM platforms generate rich link previews per article. The `--announce` delivery path only supports a single summary message, which collapses all articles into one wall of text.

By using `sessionTarget: "main"` with `payload.kind: "systemEvent"`, the cron event is processed during a heartbeat turn where you have full tool access — including the message tool. This lets you send each article individually to the user's chat. The main session model (opus) is used automatically; Model/Thinking columns don't apply.

When creating this job, set:
- `sessionTarget: "main"`
- `payload: { kind: "systemEvent", text: "Run /digest" }`
- `wakeMode: "now"`
- No `delivery` block (not needed — you deliver via the message tool yourself)

## Edge Cases
- If a cron fires during quiet hours, defer the action to the next appropriate window.
- If a skill fails (e.g., no active projects for `/digest`), log the issue in today's daily memory file but don't alert the user unless it's persistent (3+ consecutive failures).
<!-- ARCHCLAW:END -->

## Quiet Hours

- 23:00–08:00 → reply HEARTBEAT_OK unless something is urgent.

_Adjust the quiet hours window to match your schedule._
