---
name: digest
description: "Search curated architecture sources for news relevant to active projects, compile into a daily digest file. Use daily via cron or invoke manually with /digest."
---

# Architecture News Digest

Compile a daily digest of architecture news relevant to Jackie's active projects.

## Steps

1. **Load projects** — Read `workspace/projects/README.md` for the active project list. If no active projects, ask Jackie what she's working on and stop.
2. **Load sources** — Read `workspace/config/sources.md` for the curated source list.
3. **Per project** — For each active project:
   - Read its project file to get Research Topics.
   - Search each relevant source category for recent news matching the research topics. Search in both English and the user's preferred language (from `USER.md`) to maximize coverage.
   - Prioritize: project-relevant findings > techniques/materials > notable buildings.
4. **Extract images for top findings** — For the top 3-5 articles you plan to announce:
   - `web_fetch` each article page.
   - Extract the first prominent image URL from the fetched content — this is typically the hero image (building render, project photo, site plan).
   - Skip thumbnails, logos, author headshots, icons, and ad/banner images. Look for large editorial images from the article content.
   - If extraction fails for an article, move on — images are best-effort.
5. **Compile digest** — Write findings to `workspace/digests/YYYY-MM-DD.md` (today's date) in this format:

```markdown
# Architecture Digest — YYYY-MM-DD

## {Project Name}
- [{Article title}]({url}) — {one-line summary and relevance}
  ![{Article title}]({image_url})
- [{Article without image}]({url}) — {one-line summary}

## General
- [{Article title}]({url}) — {one-line summary}
  ![{Article title}]({image_url})
```

Include `![alt](image_url)` only for articles where an image was successfully extracted. Omit the image line for articles without one.

6. **Announce** — Send Jackie a concise summary of the top 3-5 findings with images. Keep it scannable — she's busy. When running via cron (no prior user message), translate the summary into her language preference from `USER.md`. If she's been writing in English this session, keep it in English.

For each announced finding that has an image, include a `MEDIA:` line on its own line immediately after that finding:

```
1. **Article Title** — one-line summary
   [Read more](url)
MEDIA:https://example.com/hero-image.jpg

2. **Article Title** — one-line summary (no image found)
   [Read more](url)
```

## Guidelines

- The digest file is always written in **English**. Preserve proper nouns and culturally specific terms in their original language in parentheses — e.g., "Bund Art Museum (外滩美术馆)".
- If a digest for today already exists, update it rather than overwriting.
- Skip sources that return nothing relevant — don't pad the digest.
- Note competition deadlines prominently (bold, with date).
- Prefer recent articles (last 48 hours) but include older ones if highly relevant.
- **Images are best-effort.** Never skip an article from the digest because its image couldn't be extracted. Text-only entries are fine.
- Prefer hero/project photography over generic banners, headshots, or logos. Architecture sites (ArchDaily, Dezeen, Divisare) reliably lead with editorial project images.
- Do not use `image_generate` to create placeholder images. If no image is found, simply omit it.
