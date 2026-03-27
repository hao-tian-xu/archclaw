---
name: project-capture
description: "Passively capture project details from conversation and keep project files up to date. Always-on — no manual invocation needed."
---

# Project Context Capture

Continuously listen for project details in conversation and update the relevant project file in `workspace/projects/` without being asked.

## What to Capture

| Signal in conversation | Where to update |
|------------------------|----------------|
| Team info — "Mengxi is doing schematics" | **Team** section |
| Client decisions — "Client picked Option A" | **Client** decision history + **Comms Log** |
| Blockers — "Waiting on the advance payment" | **Action Items** (add as open item) |
| Status changes — "We're moving to DD" | **Meta** → Phase |
| Payment updates — "Got the first payment" | **Client** → Payment status |
| Resolved items — "Sihan got the dimensions" | **Action Items** (check off) |
| New contacts or preferences | **Client** → Contact / Communication style |
| Key dates — "deadline is April 15" | **Key Details** → Key Dates |
| Budget mentions — "We have 800k for this" | **Constraints** → Budget tier |
| Timeline — "Needs to open by October" | **Constraints** → Construction timeline |
| Material preferences — "Client wants no plastic" | **Constraints** → Material restrictions |
| Environment — "It's an outdoor terrace" / "humid mall atrium" | **Constraints** → Climate/environment |
| Duration — "This is a 2-year pop-up" | **Constraints** → Lifecycle expectation |
| Sustainability — "They want LEED certified" | **Constraints** → Sustainability targets |
| Regulations — "Heritage zone, can't change facade" | **Constraints** → Regulatory |
| Modularity — "Must pack flat for transport" | **Constraints** → Modularity requirements |

## Steps

1. **Detect** — When the user mentions project-related details in conversation, identify which project and what changed.
2. **Find project file** — Look up the project in `workspace/projects/README.md`. If the project doesn't have a file yet, create one from `workspace/projects/_TEMPLATE.md` and add it to the index.
3. **Update** — Write the change to the appropriate section. If the section is missing, add it based on the template.
4. **Confirm (selectively)** — Don't announce every update. Only confirm briefly for significant changes:
   - Phase changes: "Updated Sagrada Madre — moved to design-development phase."
   - Payment status changes
   - New project file created
   - For minor updates (team notes, action items, comms log entries): stay silent.

## On Project Inquiry

When a new conversation starts and the user asks about a project, read the full project file and summarize:

- Current phase
- Open action items (highlight blocked ones)
- Last comms log entry
- Any pending blockers

No re-explanation needed from the user — the project file is the source of truth.

## Guidelines

- **Be invisible.** This skill runs in the background. Don't interrupt the conversation to ask "should I update the project file?" — just do it.
- **One source of truth.** The project file is canonical. If the user contradicts something in the file, update the file — don't argue.
- **Don't over-log.** Capture decisions and state changes, not every passing mention. "I might ask the client about tiles" is not an action item; "Client needs to confirm tile selection by Friday" is.
- **Date everything.** Use YYYY-MM-DD format for all entries in Action Items and Comms Log.
