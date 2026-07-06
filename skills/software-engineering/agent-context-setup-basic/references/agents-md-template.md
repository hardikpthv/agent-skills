# AGENTS.md template

Fill from the real project — read `package.json`/`Makefile`/CI/config for the *actual* commands; don't invent. Keep it **concise (< ~200 lines)**; it loads every turn. Omit sections that don't apply.

```markdown
# <Project name>

<One or two sentences: what this project is and its stack.>

## Commands
- Install: `<...>`
- Dev / run: `<...>`
- Build: `<...>`
- Test: `<...>`   (single test: `<...>`)
- Lint / format: `<...>`
- Typecheck: `<...>`

## Project layout
- `src/…` — <what lives here>
- `<dir>/…` — <...>
- Entry point: `<...>`

## Conventions
- Language/style: <e.g. TypeScript, 2-space indent, ESM>
- Naming: <...>
- Patterns to follow / avoid: <...>

## Architecture
- <The few decisions worth knowing — data flow, key modules, external services.>

## Do / Don't
- Run `<test command>` before committing.
- <Never edit generated files in `…`.>
- <Use `<x>` not `<y>`.>

## Keeping this file current
When you learn something durable about this project (a command changes, a
convention is corrected twice, a new module appears), update this file.
```

## Writing tips
- **Concrete + verifiable** beats vague: "API handlers live in `src/api/handlers/`" not "code is organized well."
- Prefer the **exact commands** from the repo over generic ones.
- One idea per bullet; markdown headers so agents can scan.
- **No secrets, tokens, or full file contents.** No contradictory rules.
- If some guidance only matters for certain paths/tasks, move it to a path-scoped rule or a skill instead of bloating this file.
