# Scaffolding guide (minimal hello-world)

Create the smallest thing that runs for each chosen target. Re-verify current CLI/versions — tooling changes.

## Repo shape
- **Single target** → flat repo (`src/`, config, README).
- **Multiple targets / shared code** → **monorepo**:
  ```
  repo/
  ├── apps/        # web/, mobile/, api/ — the deployables
  ├── packages/    # shared libs (ui, config, types)
  ├── AGENTS.md    # standards + context (canonical)
  ├── README.md · LICENSE · .gitignore
  ```
  Add workspace tooling (pnpm/npm/yarn workspaces; Turborepo/Nx) **only** when a second package makes it worth it — that's a pro-tier concern.

## Hello-world per target (init to something that runs)
| Target | A minimal starting point |
|--------|--------------------------|
| **Web** | Vite / a framework starter (`npm create vite@latest`, `npx create-next-app`, etc.) → a page that renders "Hello". |
| **Backend / API** | a tiny server (Express/Fastify/FastAPI/Go net/http) with one `GET /health` + a "hello" route. |
| **Android** | Android Studio "Empty Activity" (or `gradle init`) → app that shows "Hello". |
| **iOS** | Xcode "App" (SwiftUI) → a view that shows "Hello". |
| **CLI** | a single entrypoint that prints "Hello" + `--help`. |
| **Library** | `npm init` / `cargo new --lib` / `swift package init --type library` → one exported function + a test. |

Pick the stack the user asked for; don't add frameworks they didn't request.

## Recommended toolchain per target (idiomatic defaults)

Recognize the target and set up the stack's *expected* tooling — don't leave it bare. Adjust to the user's choices, but default to these:

| Target / stack | Language + types | Lint | Format | Test | Key config |
|---|---|---|---|---|---|
| **Web / Node (JS)** | **TypeScript** (`strict: true`) — not plain JS | **ESLint** | **Prettier** | **Vitest** (or Jest) | `tsconfig.json`, `.eslintrc`, `.prettierrc`, `.editorconfig` |
| **Python** | type hints + **mypy** | **Ruff** | Ruff / Black | **pytest** | `pyproject.toml` |
| **Go** | Go | **golangci-lint** | gofmt / goimports | `go test` | `.golangci.yml` |
| **Rust** | Rust | **clippy** | rustfmt | `cargo test` | `rustfmt.toml` |
| **Android** | **Kotlin** + Gradle KTS | **ktlint** or **detekt** | ktlint / Spotless | **JUnit** (+ Espresso) | `build.gradle.kts` |
| **iOS** | **Swift** + SPM | **SwiftLint** | swift-format / SwiftLint | **XCTest** | `.swiftlint.yml`, `Package.swift` |

Rules of thumb:
- **Type safety on by default** — TypeScript, Kotlin, Swift, mypy; enable strict mode.
- **One formatter + one linter**, in config, wired into the `test`/CI commands and pre-commit.
- Use the ecosystem's **standard test runner**, and leave one passing test.
- These commands go straight into `AGENTS.md` so agents run them on every change.

## Baseline tooling (every repo)
- **`.gitignore`** (node_modules, build output, `.env`, IDE files, `pro/` if applicable).
- **Formatter + linter** (Prettier/ESLint, ktlint, SwiftLint, ruff/black, gofmt) — with config.
- **A real `README`** (what it is, how to install/run/test) and a **LICENSE**.
- **One test** wired up so the test command works.
- **`git init`** + a first commit of the clean scaffold.

## Record the real commands
Capture the actual **install / run / build / test / lint** commands you just set up — they go straight into `AGENTS.md` (see standards-and-agent-files.md). Don't invent commands; use what the scaffold created.

## Don't
Over-scaffold (speculative folders, unused config), add dependencies "just in case", or reach for monorepo tooling before there's a real second package.
