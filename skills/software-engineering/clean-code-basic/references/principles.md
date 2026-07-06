# Principles, with examples

Short, language-neutral. The point of each is the same: make the code easy to change safely.

## KISS — simplest thing that works
```
# over-engineered
config = ConfigFactory.create(ConfigStrategy.DEFAULT).build().resolve()
# simple
config = load_config("config.yaml")
```

## YAGNI — don't build for imagined futures
Don't add a plugin system, a generic `handle(type, ...)` dispatcher, or five unused options because you *might* need them. Add them when a real second case appears.

## DRY — remove duplicated *knowledge*, not coincidental similarity
- **Do** extract a `taxFor(order)` used in three places.
- **Don't** merge two 3-line blocks that happen to look alike but change for different reasons — that couples unrelated things. *A little duplication is cheaper than the wrong abstraction.*

## Single Responsibility
```
# does 3 things
def handle(req): validate(req); save(req); email(req)   # split callers/orchestration from steps
```
Each function/module has **one reason to change**. A `User` class shouldn't also format HTML and talk to the DB.

## Small & focused, shallow nesting
```
# nested
if user:
    if user.active:
        if user.paid:
            return grant()
# guard clauses
if not user or not user.active or not user.paid:
    return deny()
return grant()
```

## Intention-revealing names
`d` → `daysUntilExpiry`; `flag` → `isEmailVerified`; `process()` → `chargeInvoice()`. A good name kills the comment.

## Low coupling / high cohesion
- Talk through **interfaces**, not another module's internals.
- Keep related things together; unrelated things apart. If module A breaks when B's internals change, they're too coupled.

## Composition over inheritance
Prefer small collaborating pieces over deep class hierarchies. Inheritance for "is-a" only; otherwise compose.

## The rule behind all of them
Optimize for the **reader** and for **change**. If a reasonable next person (or agent) can't quickly understand and safely modify it, simplify.
