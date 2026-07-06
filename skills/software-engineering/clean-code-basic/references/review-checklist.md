# Self-review checklist (run before you finish)

Read the code you just wrote as if reviewing someone else's PR.

## Readability
- [ ] Names reveal intent (vars, functions, files).
- [ ] No comment needed to explain *what* — only *why*, where non-obvious.
- [ ] Consistent with the surrounding code's style/patterns.

## Simplicity
- [ ] Simplest approach that meets the requirement (KISS).
- [ ] No speculative options/abstractions (YAGNI).
- [ ] No clever tricks that slow a reader down.

## Structure
- [ ] Each function does one thing; short.
- [ ] Nesting is shallow (guard clauses / early returns).
- [ ] Files are focused; split anything that grew large or mixed concerns.
- [ ] Short parameter lists; no long positional argument soup.

## Coupling & duplication
- [ ] Real duplication factored out — but not over-abstracted.
- [ ] Modules talk through clear interfaces, not each other's internals.
- [ ] No magic numbers/strings — named.

## Robustness & testability
- [ ] Errors handled at the right layer; no silent failures.
- [ ] Dependencies injectable; logic testable in isolation.
- [ ] Edge cases considered (empty, null, large input).

## Performance (hot paths only)
- [ ] No N+1 queries; no repeated work inside loops.
- [ ] Reasonable big-O on paths that run often/at scale.
- [ ] Not micro-optimizing cold paths at the cost of clarity.

## Red flags → fix
| Smell | Fix |
|---|---|
| Function > one screen / does several things | extract functions |
| File keeps growing / many responsibilities | split by concern |
| Deeply nested `if`s | guard clauses / early return |
| Copy-pasted block | shared function |
| `manager`/`util`/`data` catch-all module | give it a real, single responsibility |
| Flag parameter (`doThing(true)`) | split into two functions |
| Comment explaining a confusing line | rewrite the line clearly |
