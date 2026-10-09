---
name: app-store-onboarding-basic
description: Use when publishing a new iOS/iPadOS app to the Apple App Store / App Store Connect for the first time, or guiding someone through Apple Developer Program enrollment, agreements/tax/banking, bundle IDs and signing, the app record, TestFlight, the product page and screenshots, App Privacy labels, privacy manifests, age rating, export compliance, EU DSA trader status, In-App Purchases, or a first App Review submission.
---

# App Store Onboarding (Basic)

## Overview

Take a brand-new iOS app from nothing to a live release on the Apple App Store, following Apple's official process. This skill is the **map and the SOP**: it gives you the correct order, the must-not-skip declarations, asset specs, and the App Review traps that sink first submissions.

**Core principle: Apple changes the details constantly.** That includes the minimum Xcode/SDK, screenshot sizes, the age-rating questionnaire, privacy rules, and App Store Connect layout. This skill carries *last-known* values, but you **must fetch the live official page and re-verify** before relying on any specific number. Treat [references/official-links.md](references/official-links.md) as the source of truth, not this file.

This is the **Basic** tier: you *guide a human* through App Store Connect and Xcode. For hands-on automation (driving App Store Connect in the browser, scripting the App Store Connect API), metadata/privacy-label generation, and a verification pass, use `app-store-onboarding-pro`.

## When to use

- "Publish my iOS app to the App Store" / "set up App Store Connect"
- First-time Apple Developer Program enrollment (individual or organization)
- Bundle ID, certificates, provisioning, and uploading the first build
- TestFlight internal/external testing
- Filling out App Privacy, age rating, export compliance, or EU trader status
- Preparing the product page: text, keywords, screenshots, app previews
- Diagnosing why a first submission was rejected

**Not for:** RevenueCat / purchase *backend* wiring (use a RevenueCat skill) or Android (use `google-play-onboarding-basic`). The App Store Connect In-App Purchase *catalog* is covered here at a high level.

## First: re-verify the volatile requirements

Before doing anything else, fetch these and confirm today's values. They change, and a wrong value wastes days:

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| **Minimum Xcode / SDK** for uploads | Build rejected at upload, no grace period | `developer.apple.com/news/upcoming-requirements/` |
| **Screenshot sizes** (required device classes) | Version can't be submitted without them | `developer.apple.com/help/app-store-connect/reference/screenshot-specifications` |
| **Age-rating questionnaire** (new questions get added) | Submissions blocked until answered | `developer.apple.com/help/app-store-connect/manage-app-information/set-an-app-age-rating` |
| **Program fee** | Annual, paid at enrollment | `developer.apple.com/programs/enroll/` |

Full annotated list: [references/official-links.md](references/official-links.md).

## The onboarding sequence

Follow the ordered, checklist-style guide in **[references/onboarding-checklist.md](references/onboarding-checklist.md)**. The phases:

1. **Developer Program**: enroll with a 2FA Apple Account and pay the annual fee. Organizations also need a D-U-N-S number.
2. **Agreements, tax, banking & trader status**: Paid Apps Agreement (needed for paid apps and IAP) and the EU DSA trader declaration.
3. **Identifiers & signing**: register the bundle ID and set up distribution signing.
4. **App record**: create it in App Store Connect with name, primary language, bundle ID, and SKU.
5. **Build & upload**: archive with the required Xcode/SDK. Include the privacy manifest, permission purpose strings, and export compliance.
6. **TestFlight**: internal testers first, then external testers (needs Beta App Review).
7. **Product page**: text, keywords, category, screenshots, app previews.
8. **Privacy & declarations**: privacy policy, App Privacy labels, age rating, content rights, plus Kids/regulated declarations if they apply.
9. **Pricing, availability & IAP**: price, countries/regions, In-App Purchases/subscriptions.
10. **App Review & release**: reviewer notes and demo account, release option, submit.

## Avoid the common rejections

First submissions most often fail on these guidelines:
- **2.1 App Completeness**: crashes, placeholder content, broken links, or a login with no demo account.
- **2.3 Accurate Metadata**: misleading screenshots, or keywords stuffed with other apps' names.
- **5.1.1 Privacy**: vague permission purpose strings, or no in-app account deletion when the app has account creation.
- **3.1.1 In-App Purchase**: digital goods sold outside IAP where that isn't allowed.
- **4.2 Minimum Functionality**: a thin web wrapper.

See "Common rejections" in [references/onboarding-checklist.md](references/onboarding-checklist.md). When rejected, read the exact guideline cited in App Store Connect, fix it, and reply there before resubmitting.

## Quick reference

| Item | Last-known value (re-verify!) |
|------|-------------------------------|
| Program fee | US $99 / year |
| Upload toolchain | Xcode 26+ with the iOS/iPadOS 26 SDK (since Apr 28 2026) |
| App name / subtitle | 30 / 30 chars |
| Keywords / promotional text / description | 100 bytes / 170 chars / 4000 chars |
| App icon | 1024×1024 px, no transparency (from the asset catalog) |
| iPhone screenshots | 6.9" class, e.g. 1320×2868 px; 1–10 per localization |
| iPad screenshots (if it runs on iPad) | 13" class, e.g. 2064×2752 px; 1–10 |
| TestFlight | ≤100 internal, ≤10,000 external; builds expire after 90 days |
| Phased release (updates only) | 7 days, automatic-update users only |

## Common mistakes

- **Trusting this file's numbers without re-checking the live page.** They drift. Always re-verify.
- Building with an old Xcode/SDK, so the upload is rejected outright. Reusing a build number gets it rejected too: increment it on every upload.
- An LLC enrolling as Individual, or a contractor becoming the Account Holder. An LLC should enroll as an Organization, and the Account Holder should be the business owner.
- Choosing a bundle ID or SKU casually. Neither can be changed after the first build/record, and product IDs can never be reused.
- Answering App Privacy from memory instead of auditing every SDK, which produces a label that doesn't match the app.
- Shipping login without a working demo account in App Review Information.
- Trying to create In-App Purchases before the Paid Apps Agreement is active.
- Ignoring the EU trader-status declaration, which blocks EU distribution.
