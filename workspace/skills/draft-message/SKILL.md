---
name: draft-message
description: "Draft a tactful message for the user to send to a client, collaborator, or team member. Invoke with /draft-message."
---

# Draft Message

Help the user compose messages for professional communication — client updates, payment reminders, team coordination, scope discussions.

## Steps

1. **Identify context** — From the user's request, determine:
   - Who the recipient is (client, collaborator, team member)
   - Which project this relates to
   - What the message needs to say
   - What platform (WeChat, email, etc.) — ask if unclear
2. **Read project file** — Load the relevant project from `workspace/projects/`. Review:
   - **Client** section — communication style, decision history, payment status
   - **Team** section — recipient's role and relationship
   - **Comms Log** — recent interactions for continuity
   - **Action Items** — relevant blockers or pending items
3. **Read tone preferences** — Check `USER.md` Communication Style section for the user's tone and language defaults.
4. **Draft the message** — Write the message in the appropriate tone, language, and format:
   - Match the platform conventions (WeChat: concise, conversational; email: structured)
   - Match the relationship (client: polite/professional; collaborator: casual/direct)
   - For sensitive topics (payment, delays, scope changes): be tactful but clear
5. **Present for review** — Show the user the draft. Never send directly. Offer to adjust tone, length, or content.
6. **Log the communication** — After the user approves (or after they send it and confirm), add a one-line entry to the project's Comms Log with the date and summary.

## Message Length & Tone

**Default: short.** Most client messages should be 2–4 sentences. Payment reminders, scheduling confirmations, and status pings should be 1–2 sentences. Only go longer for scope discussions or complex multi-point updates — and even then, cap at 6–8 sentences.

**Sound like a person, not a language model.** Read the draft aloud. If it sounds like a template or a customer-service email, rewrite it. Real people:
- Skip throat-clearing ("I hope this message finds you well", "I wanted to reach out to...")
- Don't hedge everything ("I was wondering if perhaps...", "Would it be possible to maybe...")
- Use contractions and natural phrasing
- Get to the point in the first sentence

**Anti-patterns — never do these:**
- Opening with a pleasantry paragraph before the actual content
- Restating what the client already knows ("As we discussed in our last meeting...")
- Padding with unnecessary context before the ask
- Using three sentences where one would do
- Formal sign-offs on IM messages ("Best regards", "Warm wishes")

**IM (WeChat, WhatsApp, etc.):** Treat it like texting. 1–3 short messages is often better than one long block. No email-style formatting.

**Exception:** These are defaults. If the user explicitly asks for a longer or more detailed message, follow their lead.

## Guidelines

- The drafted message language depends on the **recipient**, not the user's own preference. Check `USER.md` Communication Style for audience-based language defaults. Ask if unsure.
- See **Message Length & Tone** above for length and style rules.
- For **payment reminders**: frame around project continuity ("to keep things moving smoothly"), not demands. Reference specific deliverables or next steps that depend on the payment.
- For **scope or timeline discussions**: lead with what's been accomplished, then the constraint, then the ask.
- If the project file lacks client communication style info, ask the user once and update the Client section.
- If the user says "just send it" — remind them you can't send messages directly, but you've logged it in the Comms Log.
