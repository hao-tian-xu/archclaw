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
        └── memory-maint/SKILL.md
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

## Conventions

### Editing workspace files

- All agent-facing content lives under `workspace/`. Edit those files to shape the agent's behavior.
- Write in the voice the agent will read — direct, second-person ("You are...", "Do this...").
- Keep files focused. Each file has a single responsibility. Don't merge concerns.
- Preserve existing heading structure; OpenClaw hooks may parse specific sections.

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
