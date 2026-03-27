# Archclaw — Architect Personal Assistant

An OpenClaw agent workspace configured as an architecture-focused research partner. Tracks architecture projects, curates daily news digests, and performs supplementary research. Supports multiple users under a single gateway.

## How It Works

The OpenClaw agent reads files under its workspace directory at session start to load personality, rules, and tasks. `workspace-dev/` is the **canonical template** — each user gets their own copy (`workspace-{id}/`). `openclaw.json` controls the runtime (model, tools, secrets, hooks, multi-agent routing).

Workspace files use `<!-- ARCHCLAW:BEGIN -->` / `<!-- ARCHCLAW:END -->` markers to separate protected product content from user-customizable sections. The agent is instructed to never modify protected sections.

## Structure

```
├── .env.example               # Required env vars (copy to .env and fill in)
├── openclaw.json              # Runtime config (model, tools, secrets, hooks, agents)
├── scripts/
│   └── add-user.sh            # Provision new user workspaces
├── workspace-dev/             # TEMPLATE — the ArchClaw product definition (development copy)
│   ├── AGENTS.md              # Operational rules, memory management
│   ├── SOUL.md                # Personality, values, domain expertise
│   ├── IDENTITY.md            # Name, vibe, emoji
│   ├── USER.md                # Human user profile
│   ├── TOOLS.md               # Environment notes
│   ├── HEARTBEAT.md           # Cron job health checks
│   ├── BOOTSTRAP.md           # First-run onboarding (deleted after use)
│   ├── config/
│   │   └── sources.md         # Curated architecture news/journal sources
│   ├── projects/
│   │   ├── README.md          # Active project index
│   │   └── _TEMPLATE.md       # Template for new project files
│   ├── knowledge/             # Domain knowledge reference (materials, construction, cost, etc.)
│   ├── digests/               # Daily architecture news digests
│   ├── memory/                # Session logs and heartbeat state
│   └── skills/                # Self-contained agent functions
│       ├── digest/SKILL.md    # Daily architecture news digest
│       ├── checkin/SKILL.md   # Project progress check-ins
│       ├── research/SKILL.md  # Competition/event/publication scouting
│       ├── concept-explore/SKILL.md # Concept exploration with domain knowledge
│       ├── memory-maint/SKILL.md  # Long-term memory curation
│       ├── draft-message/SKILL.md # Client/collaborator message drafting
│       └── project-capture/SKILL.md # Passive project context capture
└── workspace-{id}/            # Per-user workspace copies (gitignored)
    └── (same structure as workspace-dev/, with user-specific data)
```

## Key Features

**Project tracking** — Each architecture project gets a structured file (status, phase, research topics, findings). The agent checks in daily and logs discoveries.

**Skills-based architecture** — Core functions are modularized as self-contained skills under `workspace-dev/skills/`, each with its own SKILL.md. Cron jobs handle scheduling; HEARTBEAT.md monitors cron health.

| Skill | Schedule | What it does |
|-------|----------|-------------|
| `/digest` | Daily 9:03 AM | Search curated sources for project-relevant news, compile a digest |
| `/checkin` | Weekdays 3 PM | Check in on the stalest project, ask for updates |
| `/research` | Weekdays 4 PM | Scout competitions, events, publications, precedents |
| `memory-maint` | Sun/Wed 10 PM | Curate daily notes into long-term MEMORY.md |
| `/draft-message` | Manual | Draft tactful messages for clients or collaborators |
| `/concept-explore` | Manual | Explore design concepts with constraint-aware domain knowledge |
| `project-capture` | Passive (always-on) | Auto-update project files from conversation context |

**Memory** — Daily logs capture session context. Periodic maintenance distills them into long-term memory.

## Adding a User

1. Run `./scripts/add-user.sh <user-id>` to create a workspace copy
2. Add the agent entry to `openclaw.json` → `agents.list`
3. Add a binding to `openclaw.json` → `bindings` to route their messages
4. Restart the gateway
5. The user's first message triggers `BOOTSTRAP.md` — the agent walks them through onboarding

## Getting Started (First User)

1. Copy `.env.example` to `.env` and fill in API keys. Review `openclaw.json` for model and tool settings.
2. Run `./scripts/add-user.sh <your-id>` to create your workspace from the template.
3. Add your agent to `openclaw.json` and configure routing.
4. Launch the OpenClaw agent. It reads `BOOTSTRAP.md` and walks through onboarding: user profile, adding projects, setting up digests, running initial research.
5. `BOOTSTRAP.md` is deleted after first run.
