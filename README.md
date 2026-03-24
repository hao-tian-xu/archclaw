# Archclaw — Architect Personal Assistant

An OpenClaw agent workspace configured as an architecture-focused research partner. The agent (Tripoli) tracks architecture projects, curates daily news digests, and performs supplementary research for an independent architect.

## How It Works

The OpenClaw agent reads files under `workspace/` at session start to load its personality, rules, and tasks. Editing these files shapes the agent's behavior. `openclaw.json` controls the runtime (model, tools, secrets, hooks).

## Structure

```
├── openclaw.json              # Runtime config (model, tools, secrets, hooks)
├── workspace/
│   ├── AGENTS.md              # Operational rules, memory management
│   ├── SOUL.md                # Personality, values, domain expertise
│   ├── IDENTITY.md            # Name, vibe, emoji
│   ├── USER.md                # Human user profile
│   ├── TOOLS.md               # Environment notes
│   ├── HEARTBEAT.md           # Periodic task schedule
│   ├── BOOTSTRAP.md           # First-run onboarding (deleted after use)
│   ├── config/
│   │   └── sources.md         # Curated architecture news/journal sources
│   ├── projects/
│   │   ├── README.md          # Active project index
│   │   └── _TEMPLATE.md       # Template for new project files
│   ├── digests/               # Daily architecture news digests
│   └── memory/                # Session logs and heartbeat state
└── .context/                  # Scratch space (gitignored)
```

## Key Features

**Project tracking** — Each architecture project gets a structured file (status, phase, research topics, findings). The agent checks in daily and logs discoveries.

**Daily digests** — A morning cron job (9:03 AM local) searches curated sources for news relevant to active projects and compiles a digest.

**Supplementary research** — During afternoon hours the agent searches for competition deadlines, events, and publications tied to tracked projects.

**Memory** — Daily logs capture session context. Periodic maintenance distills them into long-term memory.

## Getting Started

1. Review and adjust `openclaw.json` (model, secrets, tool profile).
2. Pre-fill `workspace/USER.md` and `workspace/SOUL.md` if desired, or let the agent negotiate during bootstrap.
3. Launch the OpenClaw agent. It reads `workspace/BOOTSTRAP.md` and walks through onboarding: adding projects, setting up digests, running initial research.
4. `BOOTSTRAP.md` is deleted after first run.
