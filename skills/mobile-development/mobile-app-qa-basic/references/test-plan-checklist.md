# Test plan & checklist (before production)

Test each area; automate the repeatable parts (see tools-and-frameworks.md), keep exploratory + UX judgment human.

## Functional & regression
- [ ] Every core flow works to spec (auth, purchase/paywall, main feature, deep links, push).
- [ ] **Regression suite** re-run after each change — nothing that worked broke.
- [ ] **Smoke/sanity** gate: app launches, critical path works (run this first).

## Exploratory & UI/UX
- [ ] Unscripted poking around edges/error states.
- [ ] Layout across screen sizes/densities; dark mode; dynamic type; gestures; rotation; no truncation/overflow.

## Compatibility (device fragmentation)
- [ ] Runs on min-supported and latest OS; a **low-RAM / older / OEM-skin** device, not just a flagship.
- [ ] Tablets/foldables if supported.

## Performance
- [ ] Cold-start time acceptable; no visible **jank**/dropped frames on scroll/animation.
- [ ] No memory leaks / OOM on low-RAM; reasonable battery/thermal.

## Network conditions
- [ ] Offline: graceful (cached UI, clear errors, retries). Slow (2G/3G) and flaky/intermittent handled (timeouts, no hangs).

## Install / upgrade / migration
- [ ] Clean install works. **Upgrade over the previous version** preserves data (DB/schema/prefs migrate cleanly).

## Permissions
- [ ] Grant / deny / "don't ask again" / revoke-in-settings all handled without crashing; rationale shown.

## Localization & accessibility
- [ ] Translated strings, RTL, date/number/currency formats; no clipped text.
- [ ] Screen reader (TalkBack/VoiceOver) labels + focus order; touch-target size; contrast.

## Security basics
- [ ] No secrets in the binary/logs; TLS/cert validation; sensitive data stored securely.

## Monkey / stress
- [ ] `adb shell monkey` (seeded) runs many events without crash/ANR. (Finds stability, not correctness.)

## Release readiness
- [ ] Pre-launch report clean · no new crashes/ANRs · staged rollout + rollback plan.
