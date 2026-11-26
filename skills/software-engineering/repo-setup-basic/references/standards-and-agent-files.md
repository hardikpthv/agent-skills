# Agent files + engineering standards

Generate the agent context files with the standards built in, so every future change follows them. Reuse the `agent-context-setup` approach: **`AGENTS.md`** is canonical; bridge the chosen agents to it.

## Agent files (ask which agents, generate only those)
- **Canonical:** `AGENTS.md` (read by Codex, Cursor, Antigravity, Copilot).
- **Claude Code:** `CLAUDE.md` containing `@AGENTS.md` (import) — Claude doesn't read AGENTS.md natively.
- **Gemini CLI:** point `context.fileName` at `AGENTS.md`, or a thin `GEMINI.md`.
- **Cursor:** reads `AGENTS.md`; add `.cursor/rules/*.mdc` only for path-scoped rules.
See the `agent-context-setup` skill for exact paths.

## AGENTS.md template (with standards baked in)
Fill the commands/layout from the real scaffold; keep it concise (< ~200 lines).

```markdown
# <Project>
<One line: what it is + stack.>

## Commands
- Install / dev / build / test / lint / typecheck: `<the real ones>`

## Project layout
- `apps/…`, `packages/…` (or `src/…`) — what lives where.

## Engineering standards (follow these on every change)
### Clean code
- SOLID, KISS, DRY, YAGNI. Single responsibility. Small files & functions.
- Clear, intention-revealing names. Shallow nesting (guard clauses). No dead/duplicated code.
### Security (OWASP-aware)
- Never commit secrets — use env vars; `.env` is gitignored.
- Validate & sanitize all input; parameterized queries; encode output (no XSS/SQLi).
- Least privilege; authn/authz checks server-side; HTTPS/TLS; keep dependencies patched.
- No sensitive data in logs.
### Performance
- Avoid N+1 queries and work-in-loops; know the big-O of hot paths.
- Measure before micro-optimizing; clarity first.
### Testing & quality
- Add/keep tests for changes; run `<test>` and `<lint>` before committing.
- Accessible UI (labels, contrast, keyboard) where applicable.

## Do / Don't
- Run `<test>` before committing. Never edit generated files. Match existing conventions.

## Keeping this file current
When you learn something durable about this project, update this file.
```

## Depth on demand
`AGENTS.md` states the standards briefly; the deep material lives in the skills:
- **`clean-code`** — SOLID/architecture/refactorings.
- **`web-security-audit`** — OWASP checks (for defensive review).
- **`mobile-app-qa` / testing** — pre-release quality.
Reference them, don't paste them — keep `AGENTS.md` lean.

## The point
The scaffold gets the project running; `AGENTS.md` makes every future change clean, secure, and fast — automatically, for any agent.
