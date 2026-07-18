# agent-skills

Open-source **agent skills** — reusable, self-contained capabilities written in
the portable [`SKILL.md`](https://agentskills.io) format, usable by any AI agent
that supports skills. Organized by category under [`skills/`](skills/).

Skills are diverse by design, spanning mobile development, analytics, software
engineering, writing, marketing, e-commerce, and social data.

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
| Analytics | [`google-analytics-onboarding-basic`](skills/analytics/google-analytics-onboarding-basic/) | Guided SOP for setting up Google Analytics 4 (GA4) on web, Android, or iOS. |
| Analytics | [`google-tag-manager-onboarding-basic`](skills/analytics/google-tag-manager-onboarding-basic/) | Guided SOP for setting up Google Tag Manager (GTM) — account, container, GA4 tags, publishing. |
| Software Engineering | [`web-accessibility-audit-basic`](skills/software-engineering/web-accessibility-audit-basic/) | Guided WCAG 2.2 AA accessibility (a11y) audit — automated + manual + assistive-tech. |
| Software Engineering | [`web-security-audit-basic`](skills/software-engineering/web-security-audit-basic/) | Guided defensive web security audit vs OWASP Top 10 / ASVS — authorized, non-destructive. |
| Software Engineering | [`agent-context-setup-basic`](skills/software-engineering/agent-context-setup-basic/) | Generate + maintain AGENTS.md / CLAUDE.md context files so any AI agent understands the project. |
| Software Engineering | [`clean-code-basic`](skills/software-engineering/clean-code-basic/) | Apply SOLID / KISS / DRY / YAGNI, small files & functions, and clean-code review while writing code. |
| Writing | [`humanizer-basic`](skills/writing/humanizer-basic/) | Strip AI tells and rewrite text to read naturally human. |
| Writing | [`empathetic-tone-basic`](skills/writing/empathetic-tone-basic/) | Rewrite messages with a warmer, supportive, empathetic tone. |
| Writing | [`legal-writing-basic`](skills/writing/legal-writing-basic/) | Draft privacy policies, T&C, and disclaimers in formal legal English (not legal advice). |
| Writing | [`professional-tone-basic`](skills/writing/professional-tone-basic/) | Rewrite casual text into formal, professional, official language. |
| Marketing | [`web-seo-audit-basic`](skills/marketing/web-seo-audit-basic/) | Guided web SEO audit — technical, Core Web Vitals, on-page, and structured data. |
| E-commerce | [`shopify-store-onboarding-basic`](skills/ecommerce/shopify-store-onboarding-basic/) | Guided Shopify store setup — products, collections, payments, shipping, launch. |
| Social Data | [`xquik-public-data-basic`](skills/social-data/xquik-public-data-basic/) | Guided SOP for setting up Xquik public X/Twitter data workflows with REST API or MCP. |

_More categories will be added as folders under [`skills/`](skills/)._

## Use with your agent

Every skill is a portable [`SKILL.md`](https://agentskills.io) folder, so it works
with any agent that supports the Agent Skills standard — drop a skill folder into
your agent's skills directory:

| Agent | Global (all projects) | Per-project |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Codex CLI | `~/.codex/skills/` | `.agents/skills/` |
| Cursor | _(project-scoped)_ | `.cursor/skills/` |
| Antigravity | `~/.gemini/config/skills/` | `.agents/skills/` |

`.agents/skills/` is the cross-agent **project** standard (read by Codex and Antigravity).

### Quick install (helper script)

```bash
git clone https://github.com/hardikpthv/agent-skills
cd agent-skills
./install.sh claude        # global; or: codex · antigravity
./install.sh ~/my-project/.cursor/skills    # Cursor / any project path
```

Restart your agent afterward — skills load at startup.

### Claude Code marketplace (no clone needed)

```bash
/plugin marketplace add hardikpthv/agent-skills
/plugin install mobile-development@agent-skills   # or analytics · software-engineering · writing · marketing · ecommerce · social-data
```

Then invoke, e.g. `/mobile-development:google-play-onboarding-basic`.

### Manual

Copy any `skills/<category>/<skill>/` folder into one of the directories above.

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
