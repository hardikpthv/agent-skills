---
name: google-analytics-onboarding-basic
description: Use when setting up Google Analytics 4 (GA4) for the first time on a website, web app, or mobile app (Android/iOS) — creating a Google Analytics account, property, and data stream; installing the Google tag (gtag.js) or wiring the Firebase SDK for mobile; turning on enhanced measurement; configuring events and key events (formerly "conversions"); setting data retention; handling EEA consent; or linking Google Ads/BigQuery/Search Console. Use whenever someone wants to add analytics, measurement, or tracking to their app or site, asks "how do I set up Google Analytics / GA4," or needs a Measurement ID (G-XXXXXXXXXX).
---

# Google Analytics Onboarding (Basic)

## Overview

Take a website or app from zero to **GA4 collecting data you can trust**, following Google's official process. This skill is the **map and the SOP**: the right order, the web-vs-mobile fork that trips everyone up, the settings people forget, and the official links to confirm today's details.

**Core principle: Google reorganizes the GA Admin UI and renames things constantly** (e.g. "Conversions" became **Key events** in 2024). This skill carries *last-known* labels and values, but you **must open the live official page and re-verify** before trusting a specific path or name. Treat [references/official-links.md](references/official-links.md) as the source of truth, not this file.

This is the **Basic** tier: you *guide a human* through the GA and Firebase consoles. For hands-on automation — driving the GA Admin console with the Playwright MCP and scripting property/stream/key-event setup via the Admin API — use `google-analytics-onboarding-pro`.

## When to use

- "Set up Google Analytics / GA4 on my site or app"
- Creating a GA account, property, or data stream; finding the Measurement ID
- Installing the Google tag (gtag.js), wiring GA through Google Tag Manager, or adding the Firebase SDK to an Android/iOS app
- Turning on enhanced measurement, defining events, or marking **key events**
- Setting data retention, handling EEA consent, or linking Google Ads / BigQuery / Search Console

**Not for:** building dashboards/analysis *inside* GA4, ad-campaign setup in Google Ads, or non-Google analytics (Mixpanel, Amplitude, PostHog — different tools).

## Learn this first: the model

Get these four right and the rest follows:

- **Account → Property → Data stream.** An *account* is the top container (a company); a *property* is one product/brand's dataset; a *data stream* is a single source feeding it (one web, one Android, one iOS). Best practice: **one property, ≤3 streams** (web + Android + iOS) — not a separate property per platform.
- **The web/mobile fork.** **Web** is measured with the **Google tag (gtag.js)** or via **GTM**, identified by a **Measurement ID `G-XXXXXXXXXX`**. **Mobile (Android/iOS) is measured through Firebase** — the **Firebase SDK with Google Analytics**, configured by `google-services.json` / `GoogleService-Info.plist`. gtag.js does **nothing** for a native app.
- **Events are the data.** Four kinds: **automatically collected**, **enhanced measurement** (web, no code), **recommended** (predefined names you send), and **custom** (your own). Gate reporting on events, not page URLs.
- **Key events** (renamed from "Conversions" on 2024-03-21) are the events that matter to the business. You **mark** them in GA4; a Google Ads *conversion* is then created from a key event. Mark them or your "conversions" stay empty.

## First: re-verify the volatile bits

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| Admin UI paths (Data streams, Data retention, Consent) | Google moves/renames panels often | the official setup pages |
| "Key events" vs "Conversions" label | Renamed 2024; old guides mislead | support.google.com/analytics/answer/9267568 |
| Data retention default | Defaults to **2 months** — usually wrong | support.google.com/analytics/answer/7667196 |
| Consent Mode **v2** (EEA) | EEA users drop from audiences/ads without it | developers.google.com/tag-platform/security/guides/consent |

Full annotated list: [references/official-links.md](references/official-links.md).

## The onboarding sequence

Follow the ordered guide in **[references/onboarding-checklist.md](references/onboarding-checklist.md)**. The phases:

1. **Create the account** (or reuse one) — name it, set data-sharing.
2. **Create the property** — reporting time zone, currency, industry; accept ToS. (Time zone/currency aren't retroactive — set them right the first time.)
3. **Add a data stream** — Web (enter URL) or App (Android/iOS, which **auto-links a Firebase project**).
4. **Install collection** — web: paste the **Google tag** in `<head>` (or deploy via GTM / CMS); mobile: add the Firebase config file + **Firebase SDK with Analytics**. Pick **one** delivery path per stream.
5. **Enhanced measurement & events** — leave enhanced measurement on (web); add recommended/custom events for the actions you care about. See [references/data-streams-and-sdk.md](references/data-streams-and-sdk.md).
6. **Mark key events** — flag the business-critical events.
7. **Data retention & consent** — set retention to **14 months**; configure **Consent Mode v2** if you have EEA users.
8. **Verify** — confirm hits in **Realtime** and **DebugView** before declaring done.
9. **(Optional) Link products** — Google Ads, BigQuery, Search Console.

## Quick reference

| Item | Last-known detail (re-verify!) |
|------|--------------------------------|
| Web measurement | Google tag (gtag.js) or GTM; **Measurement ID `G-XXXXXXXXXX`** |
| Mobile measurement | **Firebase SDK + Google Analytics** (never gtag.js) |
| Mobile config file | `google-services.json` (Android) / `GoogleService-Info.plist` (iOS) |
| Conversions | now called **Key events** (since 2024-03-21) |
| Data retention | default **2 months** → set to **14 months** |
| EEA requirement | **Consent Mode v2** (`ad_user_data`, `ad_personalization`) |
| Verify with | **Realtime** report + **DebugView** |

## Common mistakes

- **Trusting this file's labels/paths without re-checking the live page** — the Admin UI drifts. Always re-verify.
- **Expecting the Google tag (gtag.js) to track a mobile app** — native apps need the **Firebase SDK**.
- **Double-counting** — firing gtag.js *and* a GA4 tag in GTM for the same property. Use one path.
- **Leaving data retention at 2 months** — set 14 so Explorations keep history.
- **Forgetting to mark key events** — events flow but "conversions" stay empty in GA4 and Ads.
- **Skipping Consent Mode v2 in the EEA** — EEA users silently drop out of audiences and ad data.
- **One web stream per domain** instead of one stream with **cross-domain measurement** — breaks sessions.
- **Declaring success without checking Realtime/DebugView.**
