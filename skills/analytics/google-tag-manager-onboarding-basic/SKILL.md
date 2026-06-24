---
name: google-tag-manager-onboarding-basic
description: Use when setting up Google Tag Manager (GTM) for the first time on a website or web app — creating a GTM account and container, installing the container snippet (the <head> + <body> parts), wiring the data layer, adding tags/triggers/variables (especially the GA4 Google tag and GA4 event tags, plus Google Ads, conversion, and pixel tags), previewing with Tag Assistant, and publishing versions. Also for server-side tagging and Consent Mode v2. Use whenever someone wants to manage marketing/analytics tags without editing site code each time, asks "how do I set up Google Tag Manager / GTM," mentions a GTM-XXXX container, or wants to deploy GA4 through GTM.
---

# Google Tag Manager Onboarding (Basic)

## Overview

Take a website from zero to a **working GTM container that deploys your tags** (GA4, Google Ads, pixels) without re-editing site code each time. This skill is the **map and the SOP**: the right order, the data-layer foundation people skip, and the "nothing is live until you publish" trap.

**Core principle: GTM renames tag types and shifts the console UI** — the old "GA4 Configuration" tag is now the **Google tag** with a **Tag ID**, and trigger labels drift. This skill carries *last-known* names, but you **must open the live official page and re-verify** before trusting a label. Treat [references/official-links.md](references/official-links.md) as the source of truth.

This is the **Basic** tier: you *guide a human* through the GTM console. For hands-on automation — driving the console with the Playwright MCP and doing tag/trigger/variable CRUD + publishing via the Tag Manager API — use `google-tag-manager-onboarding-pro`.

## When to use

- "Set up Google Tag Manager / GTM on my site"
- Creating a GTM account + container; installing the `GTM-XXXX` snippet
- Deploying GA4 (Google tag + event tags), Google Ads, conversion, or pixel tags through GTM
- Building the data layer, triggers, and variables; previewing and publishing versions
- Server-side tagging or Consent Mode v2 in GTM

**Not for:** the GA4 property setup itself (use a Google Analytics skill — GTM *deploys* GA4, it isn't GA4), or native mobile app tagging (that's Firebase now — see the web/mobile note below).

## Learn this first: the model

- **Account → Container → Workspace.** An *account* is the company; a *container* (`GTM-XXXX`) is one per site; a *workspace* is a draft editing space inside it. Changes live in a workspace until you publish.
- **Tags, triggers, variables.** A **tag** is code that fires (GA4, Ads, pixel). A **trigger** is the condition that fires it (pageview, click, custom event). A **variable** is a reusable value — **built-in** (toggle on, e.g. Page URL, Click ID) or **user-defined**.
- **The data layer is the foundation.** `window.dataLayer` (declared **above** the GTM snippet) is how your site passes data/events to GTM via `dataLayer.push({...})`. Tags read from it. Detail: [references/tags-triggers-variables.md](references/tags-triggers-variables.md).
- **GA4: Google tag vs event tag.** The **Google tag** (Tag ID, fires first on initialization) loads GA4; **GA4 event tags** send individual events referencing it.
- **Nothing is live until you Publish.** Edits sit in the workspace; **Submit → Publish** snapshots an immutable **version** and ships it. Preview ≠ publish.

## First: re-verify the volatile bits

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| Tag-type names ("GA4 Configuration" → **Google tag**) | Console renamed it; old guides mislead | support.google.com/tagmanager/answer/9442095 |
| Initialization trigger label | "Initialization – All Pages" vs "All Initialization Events" | the live trigger picker |
| Consent Mode **v2** (EEA) | EEA ads/measurement degrade without it | support.google.com/tagmanager/answer/13695607 |
| Server-side setup + cost | Cloud Run/App Engine steps & ~$40–45/mo change | the live server-side guide |

Full annotated list: [references/official-links.md](references/official-links.md).

## The onboarding sequence

Follow the ordered guide in **[references/onboarding-checklist.md](references/onboarding-checklist.md)**. The phases:

1. **Create the account + container** — name the container after the site's top URL; accept ToS.
2. **Install the snippet** — the `<head>` `<script>` (as high as possible, **below** any `dataLayer` declaration) **and** the `<body>` `<noscript>`, on **every page**. Remove any hardcoded tags you're migrating in.
3. **Set up the data layer** — declare `window.dataLayer` above the snippet; push the events/values your tags need.
4. **Add the GA4 Google tag** — type **Google tag**, your **Tag ID**, trigger **Initialization / All Pages** so it loads first.
5. **Add tags/triggers/variables** — GA4 event tags, Google Ads, pixels; enable the built-in variables you need.
6. **Preview** — open **Tag Assistant** and confirm the right tags fire in the right order with the right data.
7. **Submit & Publish** — name the version and publish. *Now* it's live.
8. **(Optional) Consent Mode v2 / server-side** — for EEA compliance or moving tag processing server-side.

## Web vs mobile (important)

GTM is a **web (and server-side)** product. **Native mobile app tagging is not standalone GTM anymore** — the legacy GTM mobile SDK was deprecated, and mobile measurement now runs through **Firebase + Google Analytics for Firebase** (a GTM iOS/Android container only layers on top of a Firebase implementation, mainly for centralized/server-side needs). For a mobile app, set up Firebase/GA4 directly rather than reaching for a GTM mobile container.

## Quick reference

| Item | Last-known detail (re-verify!) |
|------|--------------------------------|
| Container ID | `GTM-XXXX` |
| Snippet | two parts — `<head>` script **and** `<body>` noscript, on every page |
| Data layer | `window.dataLayer`, declared **above** the snippet |
| GA4 loader | the **Google tag** (Tag ID), fires on **Initialization** |
| Go-live | **Submit → Publish** (creates a version); nothing live before that |
| EEA | **Consent Mode v2** (`ad_user_data`, `ad_personalization`) |
| Verify | **Preview / Tag Assistant** |
| Mobile | use **Firebase**, not a GTM mobile container |

## Common mistakes

- **Double-counting** — a GTM GA4 tag **and** a hardcoded gtag/GA4 tag for the same property → every hit fires twice. Remove migrated hardcoded tags.
- **Incomplete snippet** — missing the `<body>` `<noscript>` part, or the snippet not on every page.
- **Forgetting to Publish** — edits stranded in the workspace; Preview is not live.
- **Skipping Preview** — publishing untested via Tag Assistant.
- **Data-layer timing** — `dataLayer` declared/pushed *after* the snippet, so values aren't there when tags fire. Declare it above.
- **No Consent Mode v2 in the EEA** — degraded/non-compliant ads & measurement.
- **Reaching for a GTM mobile container** — use Firebase for native apps.
