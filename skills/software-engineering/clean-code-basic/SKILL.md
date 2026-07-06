---
name: clean-code-basic
description: Use when writing, reviewing, or refactoring code and you want it to stay clean, simple, readable, and maintainable — applying software-engineering principles like SOLID, KISS, DRY, YAGNI, single responsibility, small focused files and functions, clear naming, low coupling, and performance awareness so the project stays scalable as it grows. Especially useful when generating code with AI agents (which tend toward big files and over-engineering). Use whenever writing or changing code, or when someone says "keep the code clean," "follow best practices," "make it maintainable/scalable," "refactor this," "this function is too complex," or "apply SOLID / clean code."
---

# Clean Code (Basic)

Keep code **simple, readable, and maintainable** as it's written — so the project scales instead of rotting. This matters most when code is generated fast (by agents): the default failure mode is big files, deep functions, and premature abstraction. This skill is the guardrail.

## When to use

- While **writing or changing code** in any language
- "Keep it clean / maintainable / scalable" · "refactor this" · "this is too complex"
- Applying **SOLID / KISS / DRY / YAGNI** or a clean-code review

**Not for:** bug hunting (that's debugging), security review (see `web-security-audit`), or style-only formatting (use a linter/formatter).

## The core principles

- **KISS** — the simplest thing that works. Prefer boring, obvious code over clever code.
- **YAGNI** — build for today's requirement, not an imagined future. Delete speculative flexibility.
- **DRY (but not prematurely)** — remove *real* duplication of knowledge; don't abstract two lines that merely look alike. A little duplication beats the wrong abstraction.
- **Single Responsibility** — each function, file, and module does **one** thing and has one reason to change.
- **Small & focused** — functions do one thing and stay short; files stay focused (split when they grow large or mix concerns); keep parameter lists short.
- **Intention-revealing names** — `activeUsers` not `au`; a good name removes the need for a comment.
- **Low coupling, high cohesion** — modules depend on little and expose clear interfaces; related things live together.
- **Readability first** — code is read far more than written. Optimize for the next person (or agent).
- **Composition over inheritance**; **separation of concerns**.

## SOLID in one line each

- **S** — Single Responsibility: one reason to change.
- **O** — Open/Closed: open to extension, closed to modification (add, don't rewrite).
- **L** — Liskov Substitution: subtypes must be usable wherever the base type is.
- **I** — Interface Segregation: many small interfaces beat one fat one.
- **D** — Dependency Inversion: depend on abstractions, not concrete details.

## Size & shape heuristics (guidelines, not laws)

- **Functions:** do one thing; if you need "and" to describe it, split it. Prefer early returns/guard clauses over deep nesting (aim to keep nesting shallow).
- **Files:** one clear purpose; when a file grows large or juggles several responsibilities, that's the signal to split it.
- **Parameters:** few; if many, pass an object or rethink the design.
- **No magic numbers/strings** — name them.

## Performance & scalability (aware, not premature)

- Avoid **obvious** inefficiencies: N+1 queries, work repeated inside loops, loading everything into memory, O(n²) on hot paths. Know the big-O of the hot path.
- **Don't prematurely optimize** — measure before micro-tuning; clarity first.
- Design for growth where it actually matters: pagination, statelessness, caching at real bottlenecks, indexing queries.

## Self-check before finishing

- [ ] Does each unit do **one** thing? Clear, honest names?
- [ ] Anything **too big or too nested**? Split/flatten it.
- [ ] **Real** duplication removed — without over-abstracting?
- [ ] Is this the **simplest** approach, or am I gold-plating (YAGNI)?
- [ ] Is it **testable** (small units, injected dependencies)?
- [ ] Any obvious **performance trap** on a hot path?

## Common anti-patterns

- **God object / god function** doing everything.
- **Deep nesting** (arrow code) instead of guard clauses.
- **Premature abstraction** / speculative generality.
- **Clever one-liners** that need a comment to understand.
- **Copy-paste** instead of a shared function.
- **Tight coupling** — reaching into another module's internals.
- **Huge files** the agent keeps appending to instead of splitting.
