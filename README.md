# Archclaw — Architect Personal Assistant

An OpenClaw agent workspace configured as an architecture-focused research partner. The agent (Tripoli) tracks architecture projects, curates daily news digests, and performs supplementary research for an independent architect.

## How It Works

The OpenClaw agent reads files under `workspace/` at session start to load its personality, rules, and tasks. Editing these files shapes the agent's behavior. `openclaw.json` controls the runtime (model, tools, secrets, hooks).

## Structure

```
├── .env.example               # Required env vars (copy to .env and fill in)
├── openclaw.json              # Runtime config (model, tools, secrets, hooks)
├── workspace/
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
│   ├── digests/               # Daily architecture news digests
│   ├── memory/                # Session logs and heartbeat state
│   └── skills/                # Self-contained agent functions
│       ├── digest/SKILL.md    # Daily architecture news digest
│       ├── checkin/SKILL.md   # Project progress check-ins
│       ├── research/SKILL.md  # Competition/event/publication scouting
│       ├── memory-maint/SKILL.md  # Long-term memory curation
│       ├── draft-message/SKILL.md # Client/collaborator message drafting
│       └── project-capture/SKILL.md # Passive project context capture
```

## Key Features

**Project tracking** — Each architecture project gets a structured file (status, phase, research topics, findings). The agent checks in daily and logs discoveries.

**Skills-based architecture** — Core functions are modularized as self-contained skills under `workspace/skills/`, each with its own SKILL.md. Cron jobs handle scheduling; HEARTBEAT.md monitors cron health.

| Skill | Schedule | What it does |
|-------|----------|-------------|
| `/digest` | Daily 9:03 AM | Search curated sources for project-relevant news, compile a digest |
| `/checkin` | Weekdays 3 PM | Check in on the stalest project, ask for updates |
| `/research` | Weekdays 4 PM | Scout competitions, events, publications, precedents |
| `memory-maint` | Sun/Wed 10 PM | Curate daily notes into long-term MEMORY.md |
| `/draft-message` | Manual | Draft tactful messages for clients or collaborators |
| `project-capture` | Passive (always-on) | Auto-update project files from conversation context |

**Memory** — Daily logs capture session context. Periodic maintenance distills them into long-term memory.

## Getting Started

1. Copy `.env.example` to `.env` and fill in API keys. Review `openclaw.json` for model and tool settings.
2. Pre-fill `workspace/USER.md` and `workspace/SOUL.md` if desired, or let the agent negotiate during bootstrap.
3. Launch the OpenClaw agent. It reads `workspace/BOOTSTRAP.md` and walks through onboarding: adding projects, setting up digests, running initial research.
4. `BOOTSTRAP.md` is deleted after first run.
