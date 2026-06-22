---
name: revenuecat-onboarding-basic
description: Use when integrating RevenueCat into an app for in-app purchases or subscriptions for the first time — setting up a RevenueCat project, adding a Play Store/App Store app, connecting Google Play service-account credentials, configuring products, entitlements, offerings and packages, getting the SDK API keys, installing and configuring the SDK (react-native-purchases or native), checking entitlement access, or setting up webhooks.
---

# RevenueCat Onboarding (Basic)

## Overview

Wire an app to RevenueCat so it can sell subscriptions and in-app purchases with server-side entitlement tracking. This skill is the **map and the SOP**: the correct order, RevenueCat's recommended data model, the SDK integration shape, and the official links to confirm current details.

**Core principle: RevenueCat changes SDK versions, API methods, the Google credential flow, and doc structure over time.** This skill carries *last-known* details, but you **must fetch the live official page and re-verify** before relying on a specific version or method signature. Treat [references/official-links.md](references/official-links.md) as the source of truth.

This is the **Basic** tier: you *guide* the setup through the RevenueCat dashboard + code. For hands-on automation via the **RevenueCat MCP** (creating the project, entitlements, offerings, packages, paywalls, webhooks), the Google service-account credential flow, server notifications, and a verification pass, use `revenuecat-onboarding-pro`.

## When to use

- "Set up RevenueCat" / "add subscriptions or in-app purchases via RevenueCat"
- Creating a RevenueCat project and adding a Play Store / App Store app
- Connecting Google Play credentials so RevenueCat can validate purchases
- Configuring products → entitlements → offerings → packages
- Installing/configuring the SDK and checking `entitlement.isActive`
- Setting up webhooks for purchase events

**Not for:** creating the Play Console catalog itself (use a Google Play skill — RevenueCat links to products that exist in the store) or writing your own Stripe/web billing.

## The data model (learn this first)

RevenueCat's whole design rests on four concepts. Get them right and everything else follows:

- **Product** — the actual store SKU (a Play/App Store subscription or IAP).
- **Entitlement** — a named access level (e.g. `pro`). **Products attach to entitlements**; you gate features on the *entitlement*, never on a product ID.
- **Package** — groups equivalent products across platforms (the iOS + Android "monthly") under a standard duration id like `$rc_monthly` / `$rc_annual`.
- **Offering** — a set of packages presented together. Mark one **current**; the SDK reads `offerings.current`.

> **Best practice:** reference `offerings.current` and check entitlement state in code — never hardcode product IDs. This lets you swap products, run price tests, and reorder paywalls from the dashboard with **no app release**. More in [references/modeling-and-sdk.md](references/modeling-and-sdk.md).

## The onboarding sequence

Follow the ordered guide in **[references/onboarding-checklist.md](references/onboarding-checklist.md)**. The phases:

1. **Create a RevenueCat project** (ships with a Test Store so you can build before connecting stores).
2. **Add an app** to the project (Play Store / App Store / etc.).
3. **Connect store credentials** — for Google Play, a service-account JSON with the right roles (note: validation can take **up to ~36 h (verify)**).
4. **Configure products** (import from the store or create).
5. **Create entitlements** and **attach products**.
6. **Create offerings + packages**; mark one offering current.
7. **Get the public SDK API keys** (separate key per platform on hybrid SDKs).
8. **Integrate the SDK** — `configure()`, `getOfferings()`, `purchasePackage()`, `restorePurchases()`, check `customerInfo.entitlements.active[...]`.
9. **Set up webhooks** (and server notifications — see Pro) for production reliability.
10. **Test in sandbox** before launch.

SDK integration detail and code shape: [references/modeling-and-sdk.md](references/modeling-and-sdk.md).

## Quick reference

| Thing | Last-known detail (re-verify!) |
|-------|--------------------------------|
| Gate features on | the **entitlement** (`customerInfo.entitlements.active['pro']`) |
| Show products via | `offerings.current` (never hardcoded IDs) |
| Client uses | the **public** SDK key only — separate per platform on hybrid SDKs |
| Secret v2 API key | server/MCP only — **never** in app code |
| Play credential propagation | up to ~36 hours before validation |
| Standard package ids | `$rc_monthly`, `$rc_annual`, `$rc_weekly`, `$rc_lifetime` (custom ids allowed — verify) |

## Common mistakes

- **Hardcoding product IDs** instead of using offerings/packages → can't change anything without an app release.
- **Forgetting to attach products to an entitlement** → paying users unlock nothing.
- Shipping the **secret** API key in the client (use the public SDK key).
- Debugging "invalid Play credentials" during the normal **propagation window** — wait it out.
- Trusting bundled SDK versions/method names instead of re-checking the live install/config docs.
