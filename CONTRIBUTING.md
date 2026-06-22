# Contributing

Thanks for helping grow **agent-skills**! Skills are written in the portable
`SKILL.md` format and grouped into **category folders** under `skills/`. Each
category also ships optional Claude Code plugin metadata so Claude Code users can
install a whole category with one command — but the skills work with any agent
that loads `SKILL.md` files.

## Repository layout

```
agent-skills/
├── .claude-plugin/
│   └── marketplace.json                  # Claude Code support: lists categories as plugins
└── skills/
    └── <category>/                       # e.g. mobile-development
        ├── .claude-plugin/
        │   └── plugin.json               # Claude Code support (optional)
        └── <skill-name>/
            ├── SKILL.md                  # the skill (required)
            └── references/               # optional supporting files
```

> **Why the `.claude-plugin/` files:** they let Claude Code install a category as
> a plugin. They're optional — any agent can load a skill straight from its
> `SKILL.md`. The `plugin.json` uses `"skills": ["./"]` so the skill folders in
> the category are discovered without an extra nested `skills/` folder.

## Add a skill to an existing category

1. Create `skills/<category>/<skill-name>/SKILL.md`.
2. `<skill-name>` must be **kebab-case** (e.g. `app-store-onboarding`).
3. Frontmatter:

   ```markdown
   ---
   name: your-skill-name
   description: What it does + when to use it. Agents read this to decide when to invoke the skill.
   ---

   # Your Skill
   ...instructions...
   ```

4. Put supporting files (e.g. a `references/` folder) in the same skill folder and
   link to them from `SKILL.md` with relative paths.
5. Add a row to the table in [README.md](README.md).

## Add a new category

1. Create `skills/<category>/<skill-name>/SKILL.md` (at least one skill).
2. _(Optional, for Claude Code)_ add `skills/<category>/.claude-plugin/plugin.json`:

   ```json
   {
     "name": "<category>",
     "displayName": "<Category Name>",
     "description": "...",
     "version": "0.1.0",
     "license": "MIT",
     "skills": ["./"]
   }
   ```

3. _(Optional, for Claude Code)_ register it in [`.claude-plugin/marketplace.json`](.claude-plugin/marketplace.json):

   ```json
   {
     "name": "<category>",
     "source": "./skills/<category>",
     "description": "..."
   }
   ```

4. Add a row to the README table.

## Conventions

- **Names:** kebab-case, no spaces, for category and skill names.
- **Versions:** bump the category's plugin `version` when you change its skills.
- **Test it (Claude Code):** from a clone, run `/plugin marketplace add ./`,
  install the category, and confirm the skill appears and runs.

## ⚠️ Keep paid content out of this public repo

Some skills have a paid **Pro** version (the "-pro" tier). That content is
distributed separately and must **never** be committed here. Only the free/open
version of a skill belongs in this repository.
