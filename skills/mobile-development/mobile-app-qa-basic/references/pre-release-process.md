# Pre-release process (stage the release)

Never ship straight to everyone. Promote through tracks, watch quality signals, ramp gradually. Re-verify specifics (thresholds, track rules) on the official pages.

## Android (Google Play)
1. **Internal testing** — up to 100 testers; fast QA smoke pass on real builds.
2. **Closed testing** — targeted testers for structured feedback. (New personal developer accounts often *must* complete a closed-testing period before production.)
3. **Open testing** — public beta at scale (optional).
4. **Pre-launch report** — runs automatically on every build uploaded to a test track. A **Robo** crawl installs on ~real devices and surfaces crashes, accessibility, security, and performance issues. **Read it before promoting.**
5. **Production — staged / percentage rollout.** Release to a small % first, watch metrics, then ramp. **Halt or roll back** if vitals regress.
- Docs: testing tracks `support.google.com/googleplay/android-developer/answer/9845334` · pre-launch report `.../answer/9842757` · release with confidence `play.google.com/console/about/guides/releasewithconfidence/`.

## Android vitals (quality gate)
Play's official quality signal (28-day averages). Exceeding the **"bad behavior" thresholds** can hurt discoverability and warn on the listing (re-verify current numbers):
- **User-perceived crash rate** ≥ **1.09%** of DAU (or ≥ 8% on a single device model).
- **User-perceived ANR rate** ≥ **0.47%** of DAU (or ≥ 8% per device).
- Vitals: `developer.android.com/topic/performance/vitals`.

## iOS (Apple)
1. **TestFlight — internal testers** (up to 100 App Store Connect team members; no Beta App Review; available once the build processes).
2. **TestFlight — external testers** (up to 10,000; the **first** build to a group needs **Beta App Review**, usually quick).
3. **App Store review** against the guidelines → release.
4. **Phased release** (time-based, coarser than Play's %) to ramp production.
- Docs: TestFlight `developer.apple.com/help/app-store-connect/test-a-beta-version/testflight-overview/`.

## The rule
Promote only when the current stage is clean: regression green, pre-launch report clear, no crash/ANR spike. If a stage surfaces a problem, fix and re-run — don't skip ahead.
