# agent-skills

Open-source **agent skills** — reusable, self-contained capabilities written in
the portable [`SKILL.md`](https://agentskills.io) format, usable by any AI agent
that supports skills. Organized by category under [`skills/`](skills/).

Skills are diverse by design: today it's mobile development, with software
engineering, marketing, and more to come.

## What's a skill?

Each skill is a folder under `skills/<category>/<skill-name>/` with a `SKILL.md`
entrypoint (YAML frontmatter + instructions) plus any supporting files (e.g. a
`references/` folder). `SKILL.md` is an open, cross-agent format, so the same
skill can be loaded by different agents.

## Categories & skills

| Category | Skill | What it does |
| --- | --- | --- |
| Mobile Development | [`google-play-onboarding-basic`](skills/mobile-development/google-play-onboarding-basic/) | Guided SOP for publishing a new Android app to the Google Play Store. |
| Mobile Development | [`revenuecat-onboarding-basic`](skills/mobile-development/revenuecat-onboarding-basic/) | Guided SOP for wiring an app to RevenueCat for in-app purchases & subscriptions. |

_More categories will be added as folders under [`skills/`](skills/)._

## Using these skills

**Any agent:** point it at a skill folder, or copy the folder into wherever your
agent loads skills from.

**Claude Code** — either copy a skill folder into `.claude/skills/`, or install a
whole category via the bundled marketplace:

```bash
/plugin marketplace add hardikpthv/agent-skills
/plugin install mobile-development@agent-skills
```

```bash
/mobile-development:google-play-onboarding-basic
/mobile-development:revenuecat-onboarding-basic
```

## Free vs Pro

The skills here are the **free, open-source "basic" tier** — they *guide* you
through each process. Each one has a more capable **Pro tier** that drives the
work hands-on (e.g. via browser/MCP automation). Pro skills are **not** in this
repo; they're distributed separately. The purchase channel is being finalized;
this README will link to it once it's live.

## Contributing

Contributions welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Please keep
paid/"Pro" material out of this public repo.

## License

[MIT](LICENSE)
