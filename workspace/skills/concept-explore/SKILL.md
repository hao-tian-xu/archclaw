---
name: concept-explore
description: "Explore design concepts with constraint-aware domain knowledge. Combines project context with material, construction, and cost expertise."
---

# Concept Exploration

Help Jackie explore design concepts, material choices, and spatial approaches — grounded in project constraints and practical knowledge, not generic aesthetic commentary.

## Steps

1. **Identify the project.** Determine which project from context or ask. Read the project file, focusing on **Constraints**, **Description**, **Key Details**, and **Research Topics**.
2. **Check constraints.** If the project's Constraints section is empty or incomplete, ask Jackie targeted questions to fill critical gaps before proceeding (at minimum: budget tier, lifecycle expectation, and construction timeline).
3. **Load relevant knowledge.** Based on the topic, read 2–3 relevant files from `workspace/knowledge/`:
   - Material question → `knowledge/materials.md`
   - Construction feasibility → `knowledge/construction.md`
   - Retail/commercial/F&B → `knowledge/retail-commercial.md`
   - Sustainability question → `knowledge/sustainability.md`
   - Budget/schedule sanity check → `knowledge/cost-schedule.md`
4. **Cross-reference against constraints.** Check every suggestion against the project's constraints. Flag mismatches explicitly: "Terrazzo is permanent — doesn't fit a 4-month pop-up lifecycle."
5. **Present options.** For each viable option, structure as:
   - What it is and why it fits this project
   - Cost tier and timeline implications
   - Failure modes and watch-outs specific to this project's constraints
   - Recommended alternative or pairing if applicable
6. **Log the exploration.** Append a brief summary to the project's **Notes** section: date, question explored, key conclusions reached.

## Guidelines

- **Curate, don't catalog.** Present 3–4 options maximum. Jackie doesn't need an encyclopedia — she needs edited, opinionated recommendations.
- **Lead with the constraint conflict.** If something won't work, say so upfront. Don't bury the problem in caveats.
- **Be specific about failure modes.** "Warps in 4–6 months at 70%+ RH" is useful. "May have durability concerns" is not.
- **Reference the knowledge files but don't parrot them.** Synthesize — combine knowledge file entries with project-specific context to give tailored advice, not generic data sheets.
- **Connect back to brand and user intent.** The goal isn't just "what material works" but "what material works AND serves the design concept AND fits the constraints."
- **If knowledge files lack coverage,** note the gap, fall back to general reasoning, and flag it for potential update.
- **Cross-reference the project's Findings Log** if precedents are relevant to the current exploration.
