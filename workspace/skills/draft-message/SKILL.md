---
name: draft-message
description: "Draft a tactful message for Jackie to send to a client, collaborator, or team member. Invoke with /draft-message."
---

# Draft Message

Help Jackie compose messages for professional communication — client updates, payment reminders, team coordination, scope discussions.

## Steps

1. **Identify context** — From Jackie's request, determine:
   - Who the recipient is (client, collaborator, team member)
   - Which project this relates to
   - What the message needs to say
   - What platform (WeChat, email, etc.) — ask if unclear
2. **Read project file** — Load the relevant project from `workspace/projects/`. Review:
   - **Client** section — communication style, decision history, payment status
   - **Team** section — recipient's role and relationship
   - **Comms Log** — recent interactions for continuity
   - **Action Items** — relevant blockers or pending items
3. **Read tone preferences** — Check `USER.md` Communication Style section for Jackie's tone and language defaults.
4. **Draft the message** — Write the message in the appropriate tone, language, and format:
   - Match the platform conventions (WeChat: concise, conversational; email: structured)
   - Match the relationship (client: polite/professional; collaborator: casual/direct)
   - For sensitive topics (payment, delays, scope changes): be tactful but clear
5. **Present for review** — Show Jackie the draft. Never send directly. Offer to adjust tone, length, or content.
6. **Log the communication** — After Jackie approves (or after she sends it and confirms), add a one-line entry to the project's Comms Log with the date and summary.

## Guidelines

- Default to **Mandarin Chinese** for WeChat messages to local clients and collaborators. Ask if unsure about language preference.
- Keep messages **concise**. Jackie's style is direct but polite — no filler, no over-explaining.
- For **payment reminders**: frame around project continuity ("to keep things moving smoothly"), not demands. Reference specific deliverables or next steps that depend on the payment.
- For **scope or timeline discussions**: lead with what's been accomplished, then the constraint, then the ask.
- If the project file lacks client communication style info, ask Jackie once and update the Client section.
- If Jackie says "just send it" — remind her you can't send messages directly, but you've logged it in the Comms Log.
