---
name: admob-onboarding-basic
description: Use when integrating Google AdMob to monetize a mobile app with ads — creating an AdMob account, registering the app, creating ad units (banner, interstitial, rewarded, rewarded interstitial, native, app open), integrating the Google Mobile Ads SDK, implementing consent with the UMP SDK (GDPR/EEA) and iOS App Tracking Transparency, setting up app-ads.txt, testing, and going live within policy. Use whenever someone says "set up AdMob," "add ads to my app," "monetize my app with ads," "integrate Google Mobile Ads SDK," "AdMob banner/interstitial/rewarded," or "AdMob consent / UMP."
---

# Google AdMob Onboarding (Basic)

## Overview

Integrate AdMob to earn ad revenue in a mobile app — the SDK, consent, ad units, and policy that make it work *and keep the account alive*. This skill is the **map and the SOP**.

**Core principle: AdMob changes SDK versions, consent rules, and policies constantly** (the classic Mobile Ads SDK is now in maintenance vs the **Next-Gen** SDK; `TFCD/TFUA` were replaced by **TFAT**). This skill carries *last-known* values — **re-verify against the live official page** ([references/official-links.md](references/official-links.md)). And **policy compliance is existential**: clicking your own ads, testing on live ads, or bad ad placement can **suspend the account** — permanently.

This is the **Basic** tier: you *guide a developer* through the console + integration. For hands-on setup — driving the AdMob console via the Playwright MCP, wiring the SDK/UMP/app-ads.txt in the repo, and mediation via the AdMob API — use `admob-onboarding-pro`.

## When to use

- "Set up AdMob" / "add ads to my app" / "monetize my app with ads"
- Integrating the Google Mobile Ads SDK; creating banner/interstitial/rewarded/native/app-open units
- AdMob consent (UMP), iOS ATT, or app-ads.txt

**Not for:** web ads (that's AdSense), running ad *campaigns* (that's Google Ads / the `ads` skill), or subscriptions/IAP (see `revenuecat-onboarding`).

## Learn this first: the model

- **App ID** (`ca-app-pub-…~…`, note the **`~`**) identifies the whole app — goes in `AndroidManifest.xml` / `Info.plist`. **Ad unit ID** (`…/…`, note the **`/`**) identifies one placement — used in ad-loading code. Not interchangeable.
- **Google Mobile Ads SDK** requests and renders ads; **UMP SDK** collects consent.
- **Account → App → Ad units.** One account, many apps; each app, many units.
- **Mediation** serves from multiple sources — **waterfall** (by historical eCPM) vs **bidding** (real-time auction, usually higher yield).
- **Test ads** (Google's test IDs / registered test devices) are mandatory during dev; **Ad Inspector** debugs requests.

## First: re-verify the volatile bits

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| SDK version + **Legacy vs Next-Gen** | Wrong/outdated SDK; migration in progress | developers.google.com/admob quick-start |
| **UMP / consent** rules (EEA/UK certified CMP) | No personalized ads / non-compliant without it | support.google.com/admob/answer/13554116 |
| iOS **ATT + SKAdNetwork** keys | Missing Info.plist keys break attribution/IDFA | developers.google.com/admob/ios/privacy |
| **Program policies** | Bad placement / invalid traffic → suspension | support.google.com/admob/answer/6128543 |

## The onboarding sequence

Follow **[references/onboarding-checklist.md](references/onboarding-checklist.md)**:

1. **Create the AdMob account** (add payment/tax info for payouts).
2. **Add the app** — link its Play/App Store listing, or add manually if in development → get the **App ID**.
3. **Create ad units** per planned placement → each gives an **ad unit ID**.
4. **Integrate the Mobile Ads SDK** — Android (Gradle + App ID meta-data), iOS (SPM/CocoaPods + `GADApplicationIdentifier` + `SKAdNetworkItems`).
5. **Implement consent (UMP) FIRST** — request/show the form and only request ads when `canRequestAds()` is true.
6. **Initialize the SDK** (after consent), then **load & show** ads per format.
7. **Test** with Google **test ad unit IDs** / registered devices — **never** live ads.
8. **Set up app-ads.txt** on your developer domain.
9. **Go live** — publish; ads serve once app-ads.txt is verified and the account is in good standing.

## Consent & privacy (not optional)

EEA/UK/Switzerland require a **Google-certified CMP** (the **UMP SDK**) to serve personalized ads; UMP **gates ad loading**. On iOS, add **`NSUserTrackingUsageDescription`** + call ATT, and add **`SKAdNetworkItems`** (incl. `cstr6suwn9.skadnetwork`). Tag child-directed/age treatment via **TFAT**. Detail lives in the pro tier.

## Ad formats & placement

Choose a format per placement, and place it policy-safely (no accidental clicks, no ads on loading/non-content screens): [references/ad-formats-and-policy.md](references/ad-formats-and-policy.md).

## Common mistakes

- **Clicking your own ads / testing on live ads** → invalid traffic → **suspension**. Use test IDs.
- **Ads on loading / splash / non-content screens**, or flush against buttons (accidental clicks).
- **Interstitial/app-open at the wrong time** — on first launch, exit, or mid-action.
- **Skipping UMP/consent** in the EEA, or loading ads before `canRequestAds()`.
- **No app-ads.txt** / **App ID missing** from the manifest/plist.
- **Native ads not labeled "Ad."**
