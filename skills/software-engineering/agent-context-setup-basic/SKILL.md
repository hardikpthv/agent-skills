---
name: agent-context-setup-basic
description: Use when starting or onboarding a project/repository and you want AI coding agents to understand it — generating the agent context/memory files (a canonical AGENTS.md plus CLAUDE.md, GEMINI.md, and Cursor bridges) that give any agent the project's structure, commands, and conventions every session, and keeping them updated as the project grows. Use whenever someone says "set up CLAUDE.md," "create AGENTS.md," "onboard this project for agents," "init the project context / instructions," "make this repo agent-ready," or starts a new repo.
---

# Agent Context Setup (Basic)

Set up the files that give **any** AI coding agent a project's essential context — structure, commands, conventions — automatically, every session. Agent-agnostic by design: one canonical file, bridged to whichever agents the team uses, so switching agents is free.

## What this does

1. **Learns the project** — stack, layout, build/test/run commands, conventions.
2. **Writes a canonical `AGENTS.md`** (the cross-agent standard) with that context.
3. **Bridges it to the agents you use** so each one reads it (see below).
4. **Sets up self-updating** — the file stays current as the project grows.

## When to use

- New repo/project, or "make this repo agent-ready"
- "Set up CLAUDE.md / AGENTS.md" · "create agent instructions" · "onboard this project"
- Adding a second agent/editor to a project that already has context for one

**Not for:** per-task instructions (use a skill), secrets/config (never put these in context files), or enforced rules (use hooks/permissions — these files are *context*, not enforcement).

## One source of truth (the model)

**`AGENTS.md` is the emerging cross-agent standard** (stewarded under the Linux Foundation; read by Codex, Cursor, Antigravity, Gemini CLI, Copilot, and 25+ tools). Make it canonical and bridge each agent to it — don't maintain N divergent files.

| Agent | Reads | Bridge to `AGENTS.md` |
|------|-------|------------------------|
| **Codex, Cursor, Antigravity, Copilot** | `AGENTS.md` natively | nothing — they just read it |
| **Claude Code** | `CLAUDE.md` (not AGENTS.md) | `CLAUDE.md` containing `@AGENTS.md` (import), or `ln -s AGENTS.md CLAUDE.md` |
| **Gemini CLI** | `GEMINI.md` | point `context.fileName` at `AGENTS.md`, or a thin `GEMINI.md` |

Details + exact paths: [references/agent-files-map.md](references/agent-files-map.md).

## The onboarding flow

1. **Analyze** the repo — languages, framework, entry points, `package.json`/`Makefile`/CI for the real build/test/run/lint commands, folder layout, existing conventions.
2. **Ask which agents/editors** the team uses (Claude Code, Codex, Cursor, Antigravity, Gemini, Copilot). Generate only those bridges.
3. **Write `AGENTS.md`** from the template in [references/agents-md-template.md](references/agents-md-template.md).
4. **Create the bridges** for the chosen agents (Claude `CLAUDE.md` → `@AGENTS.md`, etc.).
5. **Add the self-update note** (below) so it's maintained.

## What goes in it

Concrete, verifiable, concise (**keep it under ~200 lines** — it's loaded every turn):
- **Commands:** build, test, run, lint, typecheck (the exact ones).
- **Layout:** where things live ("API handlers in `src/api/`").
- **Conventions:** language/style, naming, patterns to follow.
- **Architecture:** the few decisions worth knowing.
- **Do / Don't:** "run `npm test` before committing", "never edit generated files."

**Never** put secrets, huge code dumps, or contradictory rules. Template: [references/agents-md-template.md](references/agents-md-template.md).

## Keep it updated (self-updating)

Treat `AGENTS.md` as living. Promote a durable learning into it whenever:
- the agent makes the same mistake twice, or you re-type the same correction;
- a command, convention, or architecture decision changes;
- a new teammate/agent would need the context.

Add a line to `AGENTS.md` itself instructing the agent to do this: *"When you learn something durable about this project, update this file."*

## Common mistakes

- **Assuming Claude Code reads `AGENTS.md`** — it doesn't; bridge via `@AGENTS.md` import or a symlink.
- **Maintaining separate divergent files per agent** — keep `AGENTS.md` canonical, bridge the rest.
- **Too long / vague** — over ~200 lines and adherence drops; be specific.
- **Secrets or huge dumps** in context files.
- **Letting it go stale** — update it as the project changes.
