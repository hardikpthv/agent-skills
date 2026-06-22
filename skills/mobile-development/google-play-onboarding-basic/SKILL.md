---
name: google-play-onboarding-basic
description: Use when publishing a new Android app to the Google Play Store / Play Console for the first time, or guiding someone through Play developer account registration, app creation, store listing, content rating (IARC), Data safety, target API level, Play App Signing, AAB upload, internal/closed/open testing tracks, or a first production release.
---

# Google Play Onboarding (Basic)

## Overview

Take a brand-new Android app from nothing to a production release on Google Play, following Google's official process. This skill is the **map and the SOP**: it gives you the correct order, the must-not-skip declarations, asset specs, and the policy traps that sink first submissions.

**Core principle: Google changes the details constantly** — fees, target API level, the new-account tester gate, console layout, asset sizes. This skill carries *last-known* values, but you **must fetch the live official page and re-verify** before relying on any specific number. Treat [references/official-links.md](references/official-links.md) as the source of truth, not this file.

This is the **Basic** tier: you *guide a human* through the Play Console UI. For hands-on browser automation (driving the Console with Playwright), asset/listing generation, and a verification pass, use `google-play-onboarding-pro`.

## When to use

- "Publish my Android app to the Play Store" / "set up Google Play Console"
- First-time developer account registration, app creation, or store listing
- Filling out content rating, Data safety, target audience, ads, or app access declarations
- Generating/checking graphic assets (icon, feature graphic, screenshots)
- Setting up testing tracks or the first production release
- Diagnosing why a first submission was rejected

**Not for:** RevenueCat / in-app purchase *backend* wiring (use a RevenueCat skill). Play Console's product *catalog* setup is covered here at a high level.

## First: re-verify the volatile requirements

Before doing anything else, fetch these and confirm today's values — they change and a wrong value wastes days:

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| **Target API level** for new apps/updates | Build rejected at upload if too low | `developer.android.com/google/play/requirements/target-sdk` |
| **New personal-account testing gate** (tester count + days before you can apply for production) | Blocks production for new accounts | `support.google.com/googleplay/android-developer/answer/14151465` |
| **Registration fee** | One-time, paid at signup | `support.google.com/googleplay/android-developer/answer/6112435` |
| **Graphic asset dimensions** | Listing won't publish without valid assets | `support.google.com/googleplay/android-developer/answer/9866151` |

Full annotated list: [references/official-links.md](references/official-links.md).

## The onboarding sequence

Follow the ordered, checklist-style guide in **[references/onboarding-checklist.md](references/onboarding-checklist.md)**. The phases:

1. **Developer account** — register, pay the one-time fee, complete identity verification (orgs also need D-U-N-S).
2. **Create the app** — name, default language, app/game, free/paid, declarations.
3. **Store listing** — title/short/full description, category, and graphic assets (exact specs in the checklist).
4. **App content declarations** — privacy policy URL, app access, ads, content rating (IARC), target audience & content, **Data safety**. None are optional.
5. **Pricing & distribution** — free/paid (free↔paid is one-way), countries.
6. **App signing & build** — Play App Signing (Google holds the signing key, you hold the upload key), upload an **AAB** (not APK).
7. **Testing tracks → production** — internal → closed → open → production; new personal accounts must clear the closed-testing gate first.
8. **Submit & roll out** — fix all flagged errors, choose rollout %, submit for review.

## Avoid the common rejections

First submissions most often fail on **metadata** (misleading/keyword-stuffed title, icon, or screenshots), a **missing/inaccurate Data safety** declaration, a **missing privacy policy**, or **unjustified sensitive permissions**. See the "Common rejections" section of [references/onboarding-checklist.md](references/onboarding-checklist.md) and the policy links. When rejected, read the exact policy named in the email and fix it before resubmitting.

## Quick reference

| Item | Last-known value (re-verify!) |
|------|-------------------------------|
| Registration fee | US $25, one-time |
| Build format | AAB required (APK not accepted for new apps) |
| App signing | Play App Signing, mandatory & auto-enrolled |
| Internal testing testers | up to 100 |
| App icon | 512×512 px, 32-bit PNG (with alpha), ≤1024 KB |
| Feature graphic | 1024×500 px, JPEG or 24-bit PNG (no alpha) |
| Phone screenshots | 2–8, each side 320–3840 px |

## Common mistakes

- **Trusting this file's numbers without re-checking the live page.** They drift. Always re-verify.
- Setting an app **free** then needing paid (free→paid is irreversible; you'd need a new app).
- Uploading an **APK** instead of an AAB.
- Skipping a declaration (Data safety, content rating, privacy policy) and wondering why the release is blocked.
- New personal account expecting instant production — you must pass the closed-testing gate first.
