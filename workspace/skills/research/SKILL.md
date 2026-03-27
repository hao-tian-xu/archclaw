---
name: research
description: "Search for architecture competitions, events, publications, and precedents relevant to active projects. Use daily via cron or invoke manually with /research."
---

# Supplementary Research

Scout for competitions, events, and publications relevant to the user's active projects.

## Steps

1. **Load projects** — Read `workspace/projects/README.md` for active projects. If none, reply HEARTBEAT_OK.
2. **Load sources** — Read `workspace/config/sources.md`, focusing on Competitions, Materials & Technology, and Research & Theory sections.
3. **Per project** — For each active project:
   - Read its project file to get Research Topics, Type, and Phase.
   - Search in both English and the user's preferred language (from `USER.md`) for:
     - **Competition deadlines** — open competitions matching the project type or research topics.
     - **Events** — exhibitions, lectures, conferences relevant to the project.
     - **Publications** — new papers, books, articles on the research topics.
     - **Precedents** — built projects similar in type, scale, or approach.
4. **Log findings** — For each finding, append to the project's `Findings Log` section:

```markdown
### YYYY-MM-DD
- [{title}]({url}) — {one-line summary and why it's relevant}
```

5. **Notify selectively** — Only message the user if something is noteworthy (upcoming deadline, highly relevant precedent). Otherwise, log silently and update `cronJobs.research.lastRun` in heartbeat-state.json.
   - **Language for notifications:** When running via cron (no prior user message), write notifications in the user's language preference from `USER.md`. When invoked manually during a conversation, use the language the user is currently using in the session.
   - **Notification format** — Keep it clean and structured (see SOUL.md § Message Aesthetics). For competition deadlines:
     ```
     {Competition Name} — deadline {YYYY-MM-DD}
     {One line on relevance to their project}
     https://competition-url
     ```
     For notable precedents or publications:
     ```
     {Title} — {author/firm if notable}
     {One line on why it's relevant}
     https://url
     ```
     No emoji. No exclamation marks. Let the content speak.

## Guidelines

- Log all findings in **English** (file log only). Preserve proper nouns and culturally specific terms in their original language in parentheses. Notifications sent to the user follow the language rules in step 5.
- Avoid duplicating findings already in the Findings Log.
- Competition deadlines are highest priority — always flag these.
- Prefer depth on 1-2 projects over shallow coverage of all.
- If a finding spans multiple projects, log it in the most relevant one and cross-reference.
