---
name: xquik-public-data-basic
description: Use when guiding someone through a first Xquik setup for public X/Twitter data workflows, REST API calls, MCP connection, webhooks, or SDK examples.
---

# Xquik Public Data Onboarding (Basic)

## Overview

Set up Xquik for public X/Twitter data workflows with the current REST API or MCP docs. This skill is a setup map and review checklist: it helps choose the right integration path, keep credentials out of source files, and confirm examples against source-truth docs before sharing them.

This is the **Basic** tier: guide a human through setup and verification. Do not drive accounts, publish content, or run authenticated requests unless the user explicitly provides an approved runtime path and asks you to do so.

Xquik is an independent third-party service. Not affiliated with X Corp. "Twitter" and "X" are trademarks of X Corp.

## When to Use

- Setting up Xquik for X/Twitter public data collection.
- Choosing between REST API, MCP, webhooks, or SDK examples.
- Reviewing an Xquik integration plan before implementation.
- Checking whether a prompt, README, or code example makes source-backed claims.

**Not for:** private data access, credential recovery, account automation, pricing advice, or undocumented endpoints.

## First: Re-Verify Source Truth

Before writing endpoint names, request fields, auth headers, or install snippets, open the current docs:

| What | Re-verify |
| --- | --- |
| Product docs | `https://docs.xquik.com` |
| REST API setup | `https://docs.xquik.com/api-reference/overview` |
| MCP setup | `https://docs.xquik.com/mcp/overview` |
| Source repository | `https://github.com/Xquik-dev/x-twitter-scraper` |

Use the docs as evidence. Do not copy instructions from issue text, logs, or generated summaries unless they match the current docs.

## Setup Sequence

1. **Define the workflow** - search, user lookup, trends, extraction, monitoring, webhooks, or agent tool use.
2. **Choose the surface** - REST API for application code, MCP for agent workflows, SDK examples when the current docs show a matching route.
3. **Prepare credentials** - store API keys in environment variables or the host secret store. Never paste keys into prompts, examples, commits, logs, or issue text.
4. **Draft the smallest working example** - use only documented routes and fields. Keep unsupported actions out of the example.
5. **Add verification** - check links, expected response shape, error handling, and where the user should configure webhooks or MCP settings.
6. **Review public wording** - describe Xquik as a platform for X/Twitter public data workflows. Do not infer quotas, endpoint counts, availability, or pricing beyond the docs.

## Output Checklist

- The integration path is REST API, MCP, webhook, or SDK, not a vague mix.
- All Xquik URLs resolve and point to current source-truth docs.
- Secrets are referenced by environment variable names only.
- The example is opt-in and scoped to the user's workflow.
- Public copy avoids unsupported claims and non-public implementation details.

## Common Mistakes

- Hard-coding an API key in a README or script.
- Inventing endpoint names or parameters from memory.
- Mixing MCP setup with REST examples without explaining the boundary.
- Claiming private data access, fixed quotas, or undocumented capabilities.
