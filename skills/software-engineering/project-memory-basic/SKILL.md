---
name: project-memory-basic
description: Use when you want to capture a repository's deep context into a portable "project memory" — the product's purpose and vision, architectural decisions and their rationale, domain knowledge and glossary, key design decisions, constraints, and direction — written to a file any AI agent can read to instantly understand what the project is and why it's built the way it is. Use whenever someone says "capture the project context/memory," "document the architecture decisions and the why," "create a project brief for agents," "remember what this repo is about," "onboard an agent to the product," or "record the domain knowledge."
---

# Project Memory (Basic)

## Overview

Capture the durable **"why"** of a repository into a **project memory** — a doc any AI agent can read to instantly grasp what the product is, who it's for, how it's built, and the reasoning behind it. Not the code; the **mental model**.

**Core principle: this is knowledge, not operations.** `AGENTS.md` covers *how to work* here (commands, layout, conventions) and must stay lean. Project memory covers *what this is and why* — product purpose, the reasons behind the architecture, the domain, the design decisions. It lives in its **own doc**, and `AGENTS.md` **links** to it so agents load the deep context on demand without bloating the lean file. And: **capture the why, don't invent it — ask the human** for the tacit knowledge the code can't tell you.

This is the **Basic** tier: you *interview + analyze and write the memory doc*. For a structured multi-file memory (ADRs, domain model, C4-style architecture), git-history mining, and a self-updating workflow, use `project-memory-pro`.

## When to use

- "Capture the project context/memory" · "document the architecture decisions + why" · "remember what this repo is about"
- Onboarding an AI agent (or a new teammate) to a product's *reasoning*, not just its files
- Recording domain knowledge, product intent, and key design decisions

**Not for:** the lean operational context file (use `agent-context-setup`), scaffolding a new repo (use `repo-setup`), or code-level API docs.

## What it captures

The memory doc covers (fill what applies) — full structure in [references/memory-template.md](references/memory-template.md):
- **Purpose & vision** — what this product is, the problem it solves, the outcome it's after.
- **Users** — who it's for; their jobs-to-be-done.
- **System mental model** — how the pieces fit; data flow; the few components that matter.
- **Architecture decisions (ADR-style)** — the key decisions + **why**, alternatives considered, trade-offs.
- **Domain knowledge** — a glossary of domain terms/entities, and the **business rules / invariants** that must always hold.
- **Product design** — key flows, UX principles, notable design decisions.
- **Tech stack + rationale** — what's used and *why it was chosen*.
- **Constraints & non-goals** — technical/business/regulatory limits, and what the product **deliberately doesn't do** (and why).
- **Integrations** — external services/APIs and why.
- **Risks / tech debt** and **direction / roadmap** (where it's heading).

## How to build it

Two sources — code + the human. See [references/capture-guide.md](references/capture-guide.md):
1. **Analyze** the repo (README, docs, code structure, key modules, git history) for the *what* and observable decisions.
2. **Interview the human** for the *why* code can't reveal — product intent, why decisions were made, alternatives rejected, domain rules, constraints. **Don't fabricate rationale.**
3. **Write** the memory doc from the template; concrete and honest.

## Where it lives

Put it in the repo — `docs/PROJECT_MEMORY.md` (or a `docs/memory/` folder). Then add a line in `AGENTS.md`: *"For product/architecture/domain background, read `docs/PROJECT_MEMORY.md`."* Link it — don't paste it into `AGENTS.md` (that file stays lean).

## Keep it alive

Project memory is durable but not frozen. Update it when a **real architecture or product decision** is made (new ADR), the domain understanding changes, or direction shifts. Add that rule to the doc itself.

## Common mistakes

- **Documenting the *what*, not the *why*** — the rationale is the whole point.
- **Dumping code / file trees** — that's not memory; capture decisions and knowledge.
- **Inventing rationale** — ask the human; mark unknowns as open questions.
- **Bloating `AGENTS.md`** with it — keep it separate and linked.
- **Letting it rot** — update on real decisions.
