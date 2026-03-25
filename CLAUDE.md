# CLAUDE.md - Guide for Claude Code

This is an **OpenClaw agent workspace** being customized as an **Architect (architecture designer) Personal Assistant** ("archclaw"). Claude Code edits and configures the workspace files. The OpenClaw agent is a separate runtime that reads these files at session start.

## Two Audiences, Two Systems

| File | Read by | Purpose |
|------|---------|---------|
| `CLAUDE.md` (this file) | **Claude Code** | How to work in this repo |
| `workspace/AGENTS.md` | **OpenClaw agent** | Operational rules, memory, heartbeats |
| `workspace/SOUL.md` | **OpenClaw agent** | Personality and ethics |
| `workspace/IDENTITY.md` | **OpenClaw agent** | Name, vibe, emoji |
| `workspace/USER.md` | **OpenClaw agent** | Info about the human user |
| `workspace/TOOLS.md` | **OpenClaw agent** | Environment-specific notes |
| `workspace/HEARTBEAT.md` | **OpenClaw agent** | Periodic task queue |
| `workspace/BOOTSTRAP.md` | **OpenClaw agent** | First-run onboarding (delete after use) |
| `openclaw.json` | **OpenClaw runtime** | Model, auth, tools, gateway config |

Do not confuse the two: when editing workspace files, you are writing *instructions for the OpenClaw agent*, not for yourself.

## Project Structure

```
.openclaw/
├── .git                    # Worktree ref
├── .gitignore              # Excludes credentials, logs, runtime state
├── openclaw.json           # Main config: model, secrets, tools, gateway, hooks
├── CLAUDE.md               # This file
└── workspace/              # The OpenClaw agent's home directory
    ├── AGENTS.md           # Operational guidelines the agent follows
    ├── SOUL.md             # Personality, ethics, tone
    ├── IDENTITY.md         # Agent identity (name, creature, vibe, emoji)
    ├── USER.md             # Profile of the human user
    ├── TOOLS.md            # Local environment notes for the agent
    ├── HEARTBEAT.md        # Cron job health checks
    ├── BOOTSTRAP.md        # First-run script (presence = never bootstrapped)
    ├── config/
    │   └── sources.md      # Curated architecture news/journal sources
    ├── projects/
    │   ├── README.md       # Active project index
    │   └── _TEMPLATE.md    # Template for new project files
    ├── digests/            # Daily architecture news digests (generated)
    ├── memory/             # Session logs and heartbeat state
    └── skills/             # Self-contained agent functions
        ├── digest/SKILL.md
        ├── checkin/SKILL.md
        ├── research/SKILL.md
        ├── memory-maint/SKILL.md
        ├── draft-message/SKILL.md
        └── project-capture/SKILL.md
```

## Architecture Domain Focus

When customizing the agent's files, keep these priorities in mind:

- **SOUL.md** — Emphasize systems-level reasoning, trade-off analysis, clear diagramming, structured communication
- **IDENTITY.md** — Establish an architect persona
- **TOOLS.md** — Include architecture-relevant tooling notes (diagramming tools, documentation generators, design review workflows)
- **HEARTBEAT.md** — Cron job health monitoring only; actual task logic lives in skills
- **Skills (`workspace/skills/*/SKILL.md`)** — Each skill is a self-contained function. Edit the SKILL.md to change what the agent does; edit HEARTBEAT.md to change when/how it's scheduled
- **USER.md** — Capture architectural interests, tech stack preferences, and project context
- **AGENTS.md** — Add architecture-specific operational rules (e.g., design review workflows, documentation standards)

## OpenClaw Documentation

Two documentation sources are available — use them instead of guessing about OpenClaw behavior:

### Official docs (https://docs.openclaw.dev)

The canonical reference. Use `WebFetch` to read specific pages when you need authoritative, up-to-date information (e.g., config schema, API specs, changelog).

### DeepWiki (AI-generated, repo: `openclaw/openclaw`)

AI-indexed documentation derived from the OpenClaw source code. Useful for understanding internals, architecture, and implementation details. Access via MCP tools:

- `mcp__deepwiki__read_wiki_structure` — browse available documentation topics
- `mcp__deepwiki__read_wiki_contents` — read full documentation pages
- `mcp__deepwiki__ask_question` — ask specific questions about OpenClaw

Key topics for this workspace: **Gateway** (2.x), **Agent Runtime** (3.x), **Tools System** (3.4.x), **Skills System** (5.x), **Cron & Scheduled Jobs** (6.x), **Configuration** (2.3.x), **Secret Management** (10.3).

Consult these docs when editing `openclaw.json`, workspace files, or adding new capabilities. Prefer DeepWiki for factual, code-grounded answers (it's derived from source code); use official docs for user-facing guides, tutorials, and changelog.

## Conventions

### Editing workspace files

- All agent-facing content lives under `workspace/`. Edit those files to shape the agent's behavior.
- Write in the voice the agent will read — direct, second-person ("You are...", "Do this...").
- Keep files focused. Each file has a single responsibility. Don't merge concerns.
- Preserve existing heading structure; OpenClaw hooks may parse specific sections.

### Skills best practices

- All task logic belongs in `workspace/skills/*/SKILL.md`, not inline in AGENTS.md. AGENTS.md should only contain short behavioral directives pointing to the skill.
- Passive/always-on skills (like `project-capture`) need an explicit directive in AGENTS.md telling the agent to apply them during conversation — a skills table entry alone isn't enough for the model to pick up on.
- The `description` field in SKILL.md frontmatter is what the LLM uses to decide when to invoke a skill — write it carefully. Only use recognized frontmatter fields: `user-invocable`, `disable-model-invocation`, `command-dispatch`.
- Skills are auto-discovered from `workspace/skills/` at session start. No registration in config is needed.

### Keeping docs in sync

- When adding, removing, or renaming skills or top-level directories, update the project structure tree in both `CLAUDE.md` and `README.md`, and the skills table in `README.md`.
- Keep these updates minimal — they're onboarding surfaces, not exhaustive documentation.

### Editing openclaw.json

- Current model: `anthropic/claude-opus-4-6`. Tool profile: `coding`. Web search: Brave.
- Secrets are resolved from environment variables (e.g., `OPENCLAW_BRAVE_API_KEY`, `OPENCLAW_GATEWAY_AUTH_TOKEN`), loaded from `.env` in the project root. Never inline secrets; `.env` is gitignored.
- The `hooks.internal.entries` block controls active built-in hooks (boot-md, session-memory, command-logger, bootstrap-extra-files).

### Git workflow

- This is a worktree from the parent `archclaw` repo at `/Users/xuhaotian/archclaw/.openclaw/`.
- Main branch: `main`. Use `hao-tian-xu/` prefix for feature branches.
- Commit workspace customizations as coherent units (e.g., "Configure architect persona in SOUL.md and IDENTITY.md").

### Bootstrap status

- `workspace/BOOTSTRAP.md` still exists = the OpenClaw agent has **never been bootstrapped**.
- You can either pre-fill IDENTITY.md/USER.md/SOUL.md with architect-specific content before bootstrap, or leave them as templates and let the agent negotiate during first run.
