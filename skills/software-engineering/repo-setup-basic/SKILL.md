---
name: repo-setup-basic
description: Use when setting up or bootstrapping a new repository or monorepo from scratch — scaffolding a minimal hello-world for the chosen target(s) (web app, Android, iOS, backend/API, CLI, library), then generating the agent context files (AGENTS.md, CLAUDE.md, Cursor, etc.) pre-loaded with engineering best practices (clean code / SOLID, security / OWASP, performance) so any AI agent builds it well from day one. Asks what the project is for and which agents to support. Use whenever someone says "set up a new repo/project," "scaffold a monorepo," "bootstrap a project," "start a new app," "initialize the repo with agent files and standards," or "new project setup."
---

# Repo Setup (Basic)

## Overview

Bootstrap a new project the right way: **ask what it's for → scaffold a minimal hello-world → generate agent context files pre-loaded with engineering standards.** The result is a clean starting point where every AI agent that touches the repo already knows to build it clean, secure, and fast.

**Core principle: keep the scaffold minimal, put the *standards* in the agent files.** A hello-world, not a framework zoo. The lasting value isn't the boilerplate — it's the `AGENTS.md` that makes every *future* change follow good practice.

This is the **Basic** tier: you *ask, scaffold, and write the agent files*. For an interactive scaffold with monorepo tooling (Turborepo/Nx/pnpm), CI + pre-commit hooks, and the full standards embedded, use `repo-setup-pro`.

## When to use

- "Set up a new repo / project" · "scaffold a monorepo" · "bootstrap a project" · "start a new app"
- Initializing a repo with agent files + engineering standards baked in

**Not for:** adding context to an *existing* repo (use `agent-context-setup`), deploying (use a deploy skill), or building out features (that's normal dev work — now guided by the standards this sets up).

## Step 1 — Ask what to set up

Don't assume. Ask:
- **Target(s):** web app · Android · iOS · backend/API · CLI · library (one or several).
- **Single repo or monorepo** (monorepo if multiple targets share code).
- **Stack / language** per target, and **package manager**.
- **Which agents/editors** to support (Claude Code, Codex, Cursor, Antigravity, Gemini) — for the context files.

## Step 2 — Scaffold (minimal hello-world)

Create the smallest thing that runs. See [references/scaffolding-guide.md](references/scaffolding-guide.md):
- **Structure** — single-package, or a monorepo layout (`apps/`, `packages/`) if multiple targets.
- **Hello-world** per target that builds and runs.
- **The idiomatic toolchain for the stack** — e.g. web → **TypeScript (strict) + ESLint + Prettier + Vitest**; Android → **Kotlin + ktlint/detekt + JUnit**; iOS → **Swift + SwiftLint + XCTest**; Python → **ruff + mypy + pytest**. Type safety on by default. (Full per-target table in the guide.)
- **Baseline** — `.gitignore`, a real `README`, license, one passing test, `git init`.
- Nothing speculative — add dependencies when a real need appears (YAGNI).

## Step 3 — Agent files + standards

Generate the agent context files with the **engineering standards** built in — reuse the `agent-context-setup` approach: a canonical **`AGENTS.md`** + bridges (`CLAUDE.md` → `@AGENTS.md`, `GEMINI.md`, Cursor) for the chosen agents, filled with the *real* commands and layout. See [references/standards-and-agent-files.md](references/standards-and-agent-files.md).

## The standards to bake in

The `AGENTS.md` should encode (concisely) so every future change follows them:
- **Clean code** — SOLID / KISS / DRY / YAGNI, single responsibility, small files & functions, clear names (see the `clean-code` skill).
- **Security** — OWASP-aware: never commit secrets, validate/escape input, least privilege, safe deps, HTTPS/TLS (see the `web-security-audit` skill).
- **Performance** — avoid obvious inefficiencies; measure before optimizing; be mindful on hot paths.
- **Testing** — a test setup and the expectation to test changes.
- **Accessibility** (for UI) and **conventions** (style, structure, commands).

## Keep it minimal

Hello-world, not a kitchen sink. The standards live in `AGENTS.md`, so they apply to everything built later — you don't need to pre-build structure to "enforce" them.

## Common mistakes

- **Over-scaffolding** — a maze of folders/config before any real code.
- **No agent files** — the standards never get written down, so agents don't follow them.
- **Standards only in someone's head** — put them in `AGENTS.md`.
- **Secrets or missing `.gitignore`** from the first commit.
- **Reaching for monorepo tooling** before there's a second package to justify it.
