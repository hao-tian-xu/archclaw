---
name: client-draft
description: "Draft client communications (WeChat messages, emails) based on project context, client preferences, and Jackie's intent. Invoke with /client-draft."
---

# Client Communication Draft

Draft messages to project clients in the right format, tone, and language.

## Steps

1. **Identify project** — Ask Jackie which project and client, or infer from recent conversation context. Read the project file.
2. **Check Client Info** — Load the Client Info section for: contact method, language, tone, relationship notes. If Client Info is empty, ask Jackie to fill in the basics and update the project file.
3. **Get intent** — Ask Jackie what she wants to communicate (or infer from context). Clarify if ambiguous.
4. **Draft message** — Based on contact method:
   - **WeChat:** Plain text only. No markdown, no links with display text. Keep it short (3-5 sentences max). Match the tone — casual = conversational Chinese, formal = polite but not stiff. Use natural greetings appropriate to the relationship.
   - **Email:** Can use formatting. Include subject line. More structured — greeting, body, sign-off. Formal by default unless Client Info says otherwise.
5. **Present draft** — Show the draft to Jackie. Offer to adjust tone, add/remove details, or switch language.
6. **Log** — After Jackie approves and sends, add an entry to the project's Communication Log with today's date, method, and brief summary.

## Guidelines

- Default to Chinese for WeChat messages to Chinese clients. Ask if unsure about language.
- Never send messages directly. Always present drafts for Jackie to review and send herself.
- Reference the Communication Log to maintain continuity — don't repeat what was just said last week.
- WeChat messages should feel like a real person texting, not a template. No "尊敬的王先生" in WeChat.
- For emails, match the formality level of the project relationship. Construction site emails are different from competition jury emails.
- If Jackie says "remind them about X" — frame it as a gentle follow-up, not a demand. Jackie's relationships matter more than any deadline.
