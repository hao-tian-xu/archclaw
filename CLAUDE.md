# CLAUDE.md - Guide for Claude Code

This is an **OpenClaw agent workspace** being customized as an **Architect (architecture designer) Personal Assistant** ("archclaw"). Claude Code edits and configures the workspace files. The OpenClaw agent is a separate runtime that reads these files at session start.

## Two Audiences, Two Systems

| File | Read by | Purpose |
|------|---------|---------|
| `CLAUDE.md` (this file) | **Claude Code** | How to work in this repo |
| `workspace-dev/AGENTS.md` | **OpenClaw agent** | Operational rules, memory, heartbeats |
| `workspace-dev/SOUL.md` | **OpenClaw agent** | Personality and ethics |
| `workspace-dev/IDENTITY.md` | **OpenClaw agent** | Name, vibe, emoji |
| `workspace-dev/USER.md` | **OpenClaw agent** | Info about the human user |
| `workspace-dev/TOOLS.md` | **OpenClaw agent** | Environment-specific notes |
| `workspace-dev/HEARTBEAT.md` | **OpenClaw agent** | Periodic task queue |
| `workspace-dev/BOOTSTRAP.md` | **OpenClaw agent** | First-run onboarding (delete after use) |
| `openclaw.json` | **OpenClaw runtime** | Model, auth, tools, gateway config |

Do not confuse the two: when editing workspace files, you are writing *instructions for the OpenClaw agent*, not for yourself.

## Project Structure

```
.openclaw/
├── .git                    # Worktree ref
├── .gitignore              # Excludes credentials, logs, runtime state
├── openclaw.json           # Main config: model, secrets, tools, gateway, hooks
├── CLAUDE.md               # This file
├── scripts/
│   └── add-user.sh         # Provision new user workspaces
├── workspace-dev/          # TEMPLATE — the canonical ArchClaw product (development copy)
│   ├── AGENTS.md           # Operational guidelines the agent follows
│   ├── SOUL.md             # Personality, ethics, tone
│   ├── IDENTITY.md         # Agent identity (name, creature, vibe, emoji)
│   ├── USER.md             # Profile of the human user
│   ├── TOOLS.md            # Local environment notes for the agent
│   ├── HEARTBEAT.md        # Cron job health checks
│   ├── BOOTSTRAP.md        # First-run script (presence = never bootstrapped)
│   ├── config/
│   │   └── sources.md      # Curated architecture news/journal sources
│   ├── projects/
│   │   ├── README.md       # Active project index
│   │   └── _TEMPLATE.md    # Template for new project files
│   ├── knowledge/          # Domain knowledge reference files (materials, construction, cost, etc.)
│   ├── digests/            # Daily architecture news digests (generated)
│   ├── memory/             # Session logs and heartbeat state
│   └── skills/             # Self-contained agent functions
│       ├── digest/SKILL.md
│       ├── checkin/SKILL.md
│       ├── research/SKILL.md
│       ├── concept-explore/SKILL.md
│       ├── memory-maint/SKILL.md
│       ├── draft-message/SKILL.md
│       └── project-capture/SKILL.md
└── workspace-{id}/         # Per-user workspace copies
    └── (same structure as workspace-dev/, with user-specific data)
```

## Multi-User Architecture

ArchClaw supports multiple users under a single OpenClaw gateway. Each user gets their own agent with an independent workspace copy.

### Template vs User Workspaces

- **`workspace-dev/`** is the **canonical template** — it defines the ArchClaw product. Edit here to change behavior for all users.
- **`workspace-{id}/`** are **per-user copies** created from the template. Each user's agent reads from their own copy. Don't edit these directly from Claude Code — they're managed by the agent at runtime.
- Some files are fully protected with no user section (IDENTITY.md, BOOTSTRAP.md) — these are identical across all users.
- Most files have both protected and user-customizable sections, including skills and knowledge files.

### Section Protection (ARCHCLAW markers)

Every workspace file uses HTML comment markers to separate ArchClaw product content from user-customizable content:

```markdown
<!-- ARCHCLAW:BEGIN - DO NOT MODIFY THIS SECTION -->
(ArchClaw product content — protected)
<!-- ARCHCLAW:END -->

(User-customizable content — freely editable by the agent)
```

The agent is instructed in AGENTS.md to never modify content between these markers. When editing template files:
- **Product changes** go inside the markers — they define the ArchClaw persona, skills, and rules.
- **User-facing sections** go outside the markers — they're where each user's agent writes personalization.
- Keep markers in sync when propagating template changes to existing user workspaces.

### Adding a New User

1. Run `./scripts/add-user.sh <user-id>` — copies the template workspace
2. Add the agent to `openclaw.json` → `agents.list`
3. Add a binding to `openclaw.json` → `bindings` to route their messages
4. Restart the gateway

### Propagating Product Changes

When you update the template (`workspace-dev/`), existing user workspaces don't auto-update. To propagate changes:
- Only sync content within ARCHCLAW markers (the protected sections)
- Never overwrite content outside markers (user customizations)
- Skills and knowledge files can be fully replaced since they're entirely protected

## Architecture Domain Focus

When customizing the agent's files, keep these priorities in mind:

- **SOUL.md** — Emphasize systems-level reasoning, trade-off analysis, clear diagramming, structured communication
- **IDENTITY.md** — Establish an architect persona
- **TOOLS.md** — Include architecture-relevant tooling notes (diagramming tools, documentation generators, design review workflows)
- **HEARTBEAT.md** — Cron job health monitoring only; actual task logic lives in skills
- **Skills (`workspace-dev/skills/*/SKILL.md`)** — Each skill is a self-contained function. Edit the SKILL.md to change what the agent does; edit HEARTBEAT.md to change when/how it's scheduled
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

- All agent-facing content lives under `workspace-dev/`. Edit those files to shape the agent's behavior.
- Write in the voice the agent will read — direct, second-person ("You are...", "Do this...").
- Never hardcode the user's name or gendered pronouns in workspace files (except `USER.md`). Use generic references ("the user", "your human", "they/their") so the agent reads identity from `USER.md` at runtime.
- Keep files focused. Each file has a single responsibility. Don't merge concerns.
- Preserve existing heading structure; OpenClaw hooks may parse specific sections.
- Respect markdown heading hierarchy. Content that belongs to a parent section (e.g., `## Cron Job Health`) must not end up visually nested under a child subsection (e.g., `### Morning Digest`). When inserting new subsections, make sure surrounding content stays scoped to the correct heading level.
- When editing template files, keep ARCHCLAW markers intact and put product changes inside them.

### Skills best practices

- All task logic belongs in `workspace-dev/skills/*/SKILL.md`, not inline in AGENTS.md. AGENTS.md should only contain short behavioral directives pointing to the skill.
- Passive/always-on skills (like `project-capture`) need an explicit directive in AGENTS.md telling the agent to apply them during conversation — a skills table entry alone isn't enough for the model to pick up on.
- The `description` field in SKILL.md frontmatter is what the LLM uses to decide when to invoke a skill — write it carefully. Only use recognized frontmatter fields: `user-invocable`, `disable-model-invocation`, `command-dispatch`.
- Skills are auto-discovered from the workspace `skills/` directory at session start. No registration in config is needed.

### Keeping docs in sync

- When adding, removing, or renaming skills or top-level directories, update the project structure tree in both `CLAUDE.md` and `README.md`, and the skills table in `README.md`.
- Keep these updates minimal — they're onboarding surfaces, not exhaustive documentation.

### Editing openclaw.json

- Current model: `anthropic/claude-opus-4-6`. Tool profile: `coding`. Web search: Brave.
- Secrets are resolved from environment variables (e.g., `OPENCLAW_BRAVE_API_KEY`, `OPENCLAW_GATEWAY_AUTH_TOKEN`), loaded from `.env` in the project root. Never inline secrets; `.env` is gitignored.
- The `hooks.internal.entries` block controls active built-in hooks (boot-md, session-memory, command-logger, bootstrap-extra-files).
- Multi-agent config lives in `agents.list`. Add new users via the provisioning script + manual config edits.

### Git workflow

- This is a worktree from the parent `archclaw` repo at `/Users/xuhaotian/archclaw/.openclaw/`.
- Main branch: `main`. Use `hao-tian-xu/` prefix for feature branches.
- Commit workspace customizations as coherent units (e.g., "Configure architect persona in SOUL.md and IDENTITY.md").
- `workspace-{id}/` directories are per-user copies. They're gitignored and shouldn't be edited directly by Claude Code.

### Bootstrap status

- `workspace-dev/BOOTSTRAP.md` always exists in the template — it's the first-run script for new users.
- Per-user workspaces: if `BOOTSTRAP.md` exists, the agent hasn't been bootstrapped yet. After first run, the agent deletes it.
