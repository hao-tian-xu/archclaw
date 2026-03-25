---
name: checkin
description: "Check in on stale architecture projects and ask Jackie for progress updates. Use daily via cron or invoke manually with /checkin."
---

# Project Check-in

Prompt Jackie for progress updates on projects that haven't been checked in recently.

## Steps

1. **Load projects** — Read `workspace/projects/README.md` for active projects.
2. **No projects?** — If no active projects exist and `lastProjectAsk` in `workspace/memory/heartbeat-state.json` is >24h ago:
   - Ask Jackie what projects she's working on.
   - Update `cronJobs.checkin.lastRun` and `lastProjectAsk` in heartbeat-state.json.
   - Stop here.
3. **Pick stalest project** — Read each active project file. Pick the one with the oldest `Last Check-in` date. Also note any open Action Items, especially blocked ones.
4. **Ask** — Ask Jackie for a brief progress update on that project. Keep it casual and specific:
   - If there are blocked action items, ask about those specifically (e.g., "Did the client send the advance payment?" rather than "How's it going?").
   - Otherwise, reference the project phase and last known status.
   - Ask one focused question, not a checklist.
5. **Update** — After Jackie responds:
   - Update the project file's `Last Check-in` date to today.
   - Append her response to the `Notes` section with today's date.
   - Update `cronJobs.checkin.lastRun` in heartbeat-state.json.

## Guidelines

- **Language:** When running via cron (no prior user message), write the check-in in the user's language preference from `USER.md`. When invoked manually, match the language the user is using in the current conversation.
- Only check in on 1 project per invocation. Don't overwhelm.
- If Jackie seems busy or gives a short answer, acknowledge and move on.
- If a project hasn't been checked in for >7 days, mention it gently.
- Respect quiet hours (23:00–08:00) — defer to next afternoon.
