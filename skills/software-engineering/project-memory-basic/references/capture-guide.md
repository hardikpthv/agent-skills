# Capture guide (how to extract the memory)

The *what* is in the repo; the *why* is mostly in people's heads. Get both — and never invent the why.

## From the repo (the observable)
- **README / docs / wiki / ADRs** — existing intent and decisions.
- **Code structure** — modules, boundaries, entry points → the system mental model.
- **Data model / schema** — the domain entities and relationships.
- **Config / infra / CI** — the tech stack and deployment shape.
- **Dependencies** — what it integrates with.
- **Git history + PRs** — *when/why* big decisions happened (commit messages, PR descriptions, issues). This is a goldmine for rationale.
- **Tests** — encode expected behavior and edge cases (domain rules).

## From the human (the tacit — interview)
Ask; don't guess. Good prompts:
- "In one paragraph, what is this and who's it for?"
- "What's the problem it solves — and how did people do it before?"
- "What are the 2–3 biggest architecture decisions, and *why* did you choose them? What did you rule out?"
- "What domain terms would confuse a newcomer? Any rules that must never be broken?"
- "What does this product deliberately **not** do?"
- "What's fragile / what would you redo? Where's it heading?"

## Synthesize → write
- Map findings to the [template](memory-template.md) sections.
- **Decisions + reasons**, not descriptions. If you only know the *what*, say so — don't manufacture a rationale.
- Mark gaps under **Open questions** for the team to fill.
- Keep it truthful and current; a confident-but-wrong memory is worse than a short honest one.

## Then wire it in
- Save to `docs/PROJECT_MEMORY.md` (or `docs/memory/`).
- Add to `AGENTS.md`: *"For product/architecture/domain background, read `docs/PROJECT_MEMORY.md`."*
- Set the expectation (in the doc) to update it when real decisions are made.

## The test
A capable engineer (or agent) reading only this memory should be able to explain **what the product is, who it's for, why the architecture is the way it is, and the domain rules** — without reading the code.
