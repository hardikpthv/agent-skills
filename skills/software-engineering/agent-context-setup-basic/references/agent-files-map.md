# Agent context files — who reads what (re-verify)

These conventions shift; confirm against each tool's docs before relying on a path.

| Agent | Project file | Global file | Reads `AGENTS.md`? |
|------|--------------|-------------|:---:|
| **Claude Code** | `CLAUDE.md` (or `.claude/CLAUDE.md`) | `~/.claude/CLAUDE.md` | ❌ (bridge needed) |
| **Codex CLI** | `AGENTS.md` (root + nested) | `~/.codex/AGENTS.md` | ✅ native |
| **Cursor** | `AGENTS.md` and/or `.cursor/rules/*.mdc` | user rules | ✅ native |
| **Gemini CLI** | `GEMINI.md` | `~/.gemini/GEMINI.md` | ⚙️ configurable (`context.fileName`) |
| **Antigravity** | `AGENTS.md` + `GEMINI.md` | `~/.gemini/GEMINI.md` | ✅ native (v1.20.3+) |
| **GitHub Copilot** | `.github/copilot-instructions.md` + `AGENTS.md` | — | ✅ native |

## The bridge pattern (one source of truth)
Keep **`AGENTS.md`** canonical. Then per chosen agent:

- **Codex / Cursor / Antigravity / Copilot** — nothing to do; they read `AGENTS.md`.
- **Claude Code** — create `CLAUDE.md` that imports it:
  ```
  @AGENTS.md
  ```
  (or symlink: `ln -s AGENTS.md CLAUDE.md` — on Windows the import is safer than a symlink).
- **Gemini CLI** — either point `context.fileName` at `AGENTS.md` in settings, or add a thin `GEMINI.md` that restates the essentials.
- **Copilot** — optionally add `.github/copilot-instructions.md` (it also reads root `AGENTS.md`).

## Notes
- **Nearest-wins:** most tools read the closest `AGENTS.md` up the directory tree, so monorepos can put a package-level `AGENTS.md` alongside the root one.
- **Claude specifics:** `CLAUDE.local.md` (gitignore) is for personal, uncommitted notes; `/init` can generate a starting `CLAUDE.md` and will fold in an existing `AGENTS.md`.
- Generate **only** the bridges for agents the team actually uses — ask first.
