# Tools & frameworks

Match the tool to the test. Re-verify current versions/links on the official docs.

## The test pyramid
- **Unit** (many, fast, host/JVM) → **Integration** (fewer) → **UI / E2E** (fewest, slow, on-device — reserve for critical journeys). Push logic down; don't E2E what a unit test can cover.
- Android fundamentals: `developer.android.com/training/testing/fundamentals`.

## UI / E2E frameworks
| Framework | Platform | Notes |
|---|---|---|
| **Espresso** | Android | in-process UI tests; auto-syncs with the UI thread; fast in CI. `developer.android.com/training/testing/espresso` |
| **UIAutomator** | Android | cross-app / system-level; mixes with Espresso. |
| **Compose UI test** | Android | `createComposeRule` for Jetpack Compose. |
| **XCUITest** | iOS | built into XCTest/Xcode; the iOS standard. |
| **Appium** | both | WebDriver-based; one framework across iOS+Android (incl. physical iOS); flexible but slower/flakier — use explicit waits. `appium.io` |
| **Maestro** | both | declarative YAML flows over the accessibility layer; fast, low flakiness, built-in smart waits; non-devs can author; less flexible than Appium. `maestro.dev` |
| **Detox** | RN | gray-box E2E for React Native. |
| **integration_test** | Flutter | Flutter's built-in E2E. |

**Choosing:** native (Espresso/XCUITest) for depth + CI speed on one platform; **Maestro** for fast, low-flake happy-path E2E and non-technical authors; **Appium** when you need one cross-platform framework.

## Device matrix — Firebase Test Lab
Google-hosted **real + virtual** devices. Run **instrumented** tests (Espresso/UIAutomator), codeless **Robo test** (auto-crawl), or **Game Loop** for games, across model × OS × orientation × locale.
- `firebase.google.com/docs/test-lab` · get started `.../test-lab/android/get-started` · Robo `.../test-lab/android/robo-ux-test`.
- Alternatives for larger physical fleets: AWS Device Farm, BrowserStack App Automate, Sauce Labs.

## Monkey / stress
- **Android** `adb shell monkey -p <pkg> -s <seed> --throttle 300 -v 10000` — random input, seeded for reproducibility. Finds crashes/ANRs, not correctness. `developer.android.com/studio/test/other-testing-tools/monkey`
- `monkeyrunner` is a separate scripted (Python) tool, not random input. iOS: no official monkey.

## Crash / stability monitoring
- **Firebase Crashlytics** — crashes, non-fatals, **ANRs**, release monitoring. `firebase.google.com/docs/crashlytics`
- **Play Android vitals** — official quality signal + thresholds (see pre-release-process.md).

## Picking a device matrix
Choose by your own analytics' top models/OS versions, a span of screen sizes/densities, a **low-RAM/old** device, min + latest OS, and key locales — not "every device."
