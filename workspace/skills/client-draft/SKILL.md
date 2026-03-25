---
name: client-draft
description: "Draft messages for Jackie to send to clients, collaborators, or team members — WeChat, email, or other channels. Invoke with /client-draft."
---

# Client Communication Draft

Help Jackie compose messages for professional communication — client updates, payment reminders, team coordination, scope discussions.

## Steps

1. **Identify context** — From Jackie's request or recent conversation, determine:
   - Who the recipient is (client, collaborator, team member)
   - Which project this relates to
   - What the message needs to say
   - What platform (WeChat, email, etc.) — ask if unclear
2. **Read project file** — Load the relevant project from `workspace/projects/`. Review:
   - **Client** section — contact channel, language, tone, communication style, decision history, payment status
   - **Team** section — recipient's role and relationship
   - **Comms Log** — recent interactions for continuity
   - **Action Items** — relevant blockers or pending items
3. **Check tone defaults** — Read `USER.md` Communication Style section for Jackie's general tone and language preferences.
4. **Draft message** — Based on contact method:
   - **WeChat:** Plain text only. No markdown, no links with display text. Keep it short (3-5 sentences max). Match the tone — casual = conversational Chinese, formal = polite but not stiff. Use natural greetings appropriate to the relationship.
   - **Email:** Can use formatting. Include subject line. More structured — greeting, body, sign-off. Formal by default unless Client section says otherwise.
5. **Present draft** — Show Jackie the draft. Never send directly. Offer to adjust tone, length, or content.
6. **Log** — After Jackie approves and sends, add an entry to the project's Comms Log with today's date, method, and brief summary.

## Guidelines

- Default to **Mandarin Chinese** for WeChat messages to local clients and collaborators. Ask if unsure about language preference.
- Never send messages directly. Always present drafts for Jackie to review and send herself. If Jackie says "just send it" — remind her you can't send messages directly, but you've logged it in the Comms Log.
- Reference the Comms Log to maintain continuity — don't repeat what was just said last week.
- WeChat messages should feel like a real person texting, not a template. No "尊敬的王先生" in WeChat.
- For emails, match the formality level of the project relationship. Construction site emails are different from competition jury emails.
- For **payment reminders**: frame around project continuity ("to keep things moving smoothly"), not demands. Reference specific deliverables or next steps that depend on the payment.
- For **scope or timeline discussions**: lead with what's been accomplished, then the constraint, then the ask.
- If Jackie says "remind them about X" — frame it as a gentle follow-up, not a demand. Jackie's relationships matter more than any deadline.
- If the project file lacks client communication style info, ask Jackie once and update the Client section.
