# Project memory template

Fill what applies; omit what doesn't. Concrete over vague. Capture the **why**, and mark anything you're unsure of as an open question rather than inventing it.

```markdown
# <Product / Project> — Project Memory
_Last updated: <date> · Owners: <who>_

## 1. Purpose & vision
- What it is, in one paragraph.
- The problem it solves and for whom.
- The outcome / "what winning looks like."

## 2. Users
- Primary users / personas and their jobs-to-be-done.
- What they care about; what would make them leave.

## 3. System mental model
- The 3–6 components that matter and how they fit (a short prose or ASCII sketch).
- The core data flow / request lifecycle.
- Where the complexity lives.

## 4. Architecture decisions (ADRs)
For each significant decision:
> **ADR-00N: <decision>**
> - **Context:** what forced the decision.
> - **Decision:** what we chose.
> - **Why / alternatives:** options considered + trade-offs; why this won.
> - **Consequences:** what it commits us to.
(e.g. "monolith vs services," "Postgres vs X," "auth approach," "sync vs queue.")

## 5. Domain knowledge
- **Glossary:** domain terms & entities, defined precisely.
- **Business rules / invariants:** things that must always hold (e.g. "an order can't ship before payment clears").
- Edge cases and domain gotchas.

## 6. Product design
- Key user flows; UX principles; notable design decisions and why.

## 7. Tech stack + rationale
- Languages, frameworks, infra — and **why each was chosen** (not just what).

## 8. Constraints & non-goals
- Constraints: performance, security/compliance, budget, timeline, platform.
- **Non-goals:** what we deliberately don't do, and why.

## 9. Integrations
- External services/APIs, what they're for, why chosen, key gotchas.

## 10. Risks & tech debt
- Known risks, fragile areas, deferred decisions.

## 11. Direction / roadmap
- Where it's heading; upcoming big bets; anything that will reshape the above.

## Open questions
- Things not yet known / to confirm with the team.

## Keeping this current
- Update on any real architecture or product decision (add an ADR), domain change, or direction shift.
```

## Notes
- Prefer **decisions + reasons** over descriptions. An agent can read the code for *what*; it needs this for *why*.
- Keep entries tight; this can be long (unlike AGENTS.md), but every line should earn its place.
