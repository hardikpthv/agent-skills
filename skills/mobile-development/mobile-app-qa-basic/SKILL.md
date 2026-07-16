---
name: mobile-app-qa-basic
description: Use when testing a mobile app (Android/iOS) before shipping to production — planning QA, functional and regression testing, smoke/sanity, monkey/stress testing, device-compatibility, performance, network, install/upgrade, and permissions checks, plus using Google Play testing tracks + the pre-launch report + Android vitals and Apple TestFlight for a safe staged release. Use whenever someone says "test my app before release," "QA the app," "regression testing," "monkey testing," "pre-launch checks," "is my app ready for production," or "set up mobile testing."
---

# Mobile App QA (Basic)

## Overview

Get a mobile app **production-ready**: what to test, how to release without breaking users, and the tools that do it. This skill is the **map and the SOP**.

**Core principle: automated crawlers (monkey/Robo) find *crashes*, not *correctness*.** You still need real assertions and human judgment. And **never ship straight to 100%** — stage the rollout so a bad build hits few users and can be halted. Tools/thresholds change (e.g. Android vitals limits) — re-verify against [references/tools-and-frameworks.md](references/tools-and-frameworks.md) links.

This is the **Basic** tier: you *plan the QA and run it manually + with basic tooling*. For hands-on automation — authoring Maestro/Espresso/XCUITest suites, running `adb monkey`, a Firebase Test Lab device matrix, CI gating, and crash triage — use `mobile-app-qa-pro`.

## When to use

- "Test my app before release" / "is it production-ready?" / "QA the app"
- Regression, smoke, monkey/stress, compatibility, performance, install/upgrade testing
- Setting up Play testing tracks / pre-launch report / TestFlight for a safe release

**Not for:** unit-test authoring in isolation (that's dev work — though it's the base of the pyramid), store *submission/listing* (see `google-play-onboarding`), or web app testing.

## The testing types

Cover these before production — details + a checklist in [references/test-plan-checklist.md](references/test-plan-checklist.md):
**Functional · Regression · Smoke/sanity · Exploratory · UI/UX · Compatibility (device fragmentation) · Performance (cold-start, jank, memory, battery) · Network (offline/slow/flaky) · Install/upgrade/migration · Permissions · Localization · Accessibility · Security basics · Monkey/stress.**

## The test pyramid

Many fast **unit** tests → fewer **integration** tests → fewest **UI/E2E** tests (slow, on-device; reserve for critical journeys). Push logic down the pyramid. Frameworks + when to use each: [references/tools-and-frameworks.md](references/tools-and-frameworks.md).

## The pre-release process

Release in stages, never all at once. See [references/pre-release-process.md](references/pre-release-process.md):
- **Android (Play):** internal → closed → open testing → production; every uploaded build gets a **pre-launch report** (Robo crawl on real devices); watch **Android vitals** (crash/ANR rates); ship with a **staged/percentage rollout** and halt/rollback on regressions.
- **iOS (Apple):** **TestFlight** internal testers, then external (first external build needs Beta App Review) → App Store review → phased release.

## Monkey / stress testing

Android's **`adb shell monkey`** fires random taps/gestures/events to shake out crashes and ANRs — use a **seed** so failures reproduce:
`adb shell monkey -p com.your.app -s 12345 --throttle 300 -v 10000`
(iOS has no official monkey — use XCUITest with randomized input or a third-party tool.) Monkey finds *stability* bugs, not *correctness*.

## Release-readiness checklist

Before promoting to production:
- [ ] Regression suite green; smoke pass on the critical path.
- [ ] Tested on a **device matrix** — incl. a **low-RAM / old-OS** device, not just a flagship.
- [ ] **Install *and* upgrade** tested (data migrates without loss).
- [ ] Offline / slow-network behavior verified; permissions grant/deny/revoke handled.
- [ ] **Pre-launch report clean**; no new crashes/ANRs in Crashlytics/vitals.
- [ ] Monkey/stress run without crashing.
- [ ] **Staged rollout** + rollback plan ready.

## Common mistakes

- **Testing only the newest flagship** — misses low-RAM, old-OS, OEM-skin bugs.
- **No regression suite** — old bugs quietly return.
- **Skipping install/upgrade/migration** — clean install works, upgrade corrupts data.
- **Ignoring low-memory / slow / offline** conditions.
- **No monkey/stress**; **manual-only** QA that isn't repeatable in CI.
- **Not reading the pre-launch report**; **shipping straight to 100%** with no rollback.
