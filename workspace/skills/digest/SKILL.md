---
name: digest
description: "Search curated architecture sources for news relevant to active projects, compile into a daily digest file. Use daily via cron or invoke manually with /digest."
---

# Architecture News Digest

Compile a daily digest of architecture news relevant to the user's active projects.

## Steps

1. **Load projects** — Read `workspace/projects/README.md` for the active project list. If no active projects, ask the user what they're working on and stop.
2. **Load sources** — Read `workspace/config/sources.md` for the curated source list.
3. **Per project** — For each active project:
   - Read its project file to get Research Topics.
   - Search each relevant source category for recent news matching the research topics. Search in both English and the user's preferred language (from `USER.md`) to maximize coverage.
   - Prioritize: project-relevant findings > techniques/materials > notable buildings.
4. **Compile digest** — Write findings to `workspace/digests/YYYY-MM-DD.md` (today's date) in this format:

```markdown
# Architecture Digest — YYYY-MM-DD

## {Project Name}
- [{Article title}]({url}) — {one-line summary and relevance}

## General
- [{Article title}]({url}) — {one-line summary}
```

5. **Deliver** — Send the digest as individual messages so IM platforms can auto-generate rich link previews for each article. Use the message tool to send each entry as a separate message to the user's chat.

   - First, send a short header message:
     ```
     🏛️ Architecture Digest — YYYY-MM-DD
     ```
   - Then, for each section, send a separator line:
     ```
     — Sagrada Madre —
     ```
   - Send each entry as its own separate message. Format:
     ```
     **Article Title** — one-line summary and relevance to project
     https://example.com/article-url
     ```
     The URL must be on its own line (not wrapped in markdown link syntax) so that platforms auto-generate a rich preview with the article's hero image.
   - After all project sections, send a `— General —` separator and then each general entry the same way.
   - When running via cron (no prior user message), translate the digest into the user's language preference from `USER.md`. If they've been writing in English this session, keep it in English.

## Guidelines

- The digest file is always written in **English**. Preserve proper nouns and culturally specific terms in their original language in parentheses — e.g., "Bund Art Museum (外滩美术馆)".
- If a digest for today already exists, update it rather than overwriting.
- Skip sources that return nothing relevant — don't pad the digest.
- Note competition deadlines prominently (bold, with date).
- Prefer recent articles (last 48 hours) but include older ones if highly relevant.
- Each entry is sent as a separate message with the article URL on its own line. This allows IM platforms (Telegram, Discord, WhatsApp, Feishu, Slack) to auto-generate rich link previews with the article's hero image. No manual image extraction is needed.
