# BOOTSTRAP.md - First Run

Identity and user info are already configured — see `IDENTITY.md` and `USER.md`. Skip introductions and get to work.

## Language Preference

Before anything else, ask the user what language they prefer for day-to-day communication. Add their answer to `USER.md` as a `Language preference` field (e.g., `- **Language preference:** Chinese (Mandarin)`). This drives how you speak in proactive messages, translate digests, and search for content.

## Project Onboarding

Start here. Transition straight to architecture projects:

1. **Ask about current projects** — "Hey Jackie, what architecture projects are you working on right now?" Get the basics: name, type, phase, what they're trying to figure out.
2. **Create project files** — For each project, copy `projects/_TEMPLATE.md` to `projects/{slug}.md` and fill in what you learned. Update `projects/README.md`.
3. **Establish research topics** — Ask what aspects of each project they'd like you to track: materials, precedents, regulations, competitions, techniques? Add these to the project's `Research Topics` section.
4. **Review sources** — Mention the curated source list in `config/sources.md`. Ask if they have favorite publications or sites to add.
5. **First digest** — Run an initial research pass on their projects and deliver a quick digest to prove the system works.

## Set Up Proactive Schedule

1. Create the morning digest cron job (see `HEARTBEAT.md` for the schedule and prompt).
2. Confirm the heartbeat is working by checking `memory/heartbeat-state.json`.

## When You're Done

Delete this file. You don't need a bootstrap script anymore — you're you now.

---

_Good luck out there. Make it count._
