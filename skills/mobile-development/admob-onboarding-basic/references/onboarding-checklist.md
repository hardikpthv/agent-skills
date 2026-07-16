# AdMob onboarding checklist (ordered)

Re-verify SDK versions/paths against [official-links.md](official-links.md) — they change. Use **test ads** the entire time.

## 1. Account
- [ ] Sign up at admob.google.com with a Google account.
- [ ] Add **payment + tax/identity** info (needed to get paid, not to integrate).

## 2. Add the app
- [ ] **Add app** → link its Google Play / App Store listing, **or** add manually if still in development.
- [ ] Copy the **App ID** (`ca-app-pub-…~…`).

## 3. Create ad units
- [ ] One per planned placement; pick the format. Copy each **ad unit ID** (`ca-app-pub-…/…`).

## 4. Integrate the Mobile Ads SDK
- **Android:** `google()` + `mavenCentral()` repos; add `play-services-ads` (re-verify version); put the **App ID** in `AndroidManifest.xml` as `com.google.android.gms.ads.APPLICATION_ID` meta-data. (min SDK / compile SDK per docs.)
- **iOS:** add the SDK via **SPM** or **CocoaPods**; add `GADApplicationIdentifier` (App ID) **and** `SKAdNetworkItems` to `Info.plist`.

## 5. Consent FIRST (UMP)
- [ ] Request consent info **every launch**; show the form if required.
- [ ] Expose a persistent **privacy options** entry point where required.
- [ ] Only request ads once **`canRequestAds()`** is true.
- [ ] iOS: add `NSUserTrackingUsageDescription`; call **ATT** and wait for the result before loading ads.

## 6. Initialize + load ads
- [ ] Initialize the SDK (once, at launch, **after** consent flags are set).
- [ ] Load & show ads per the format guide.

## 7. Test (never live ads)
- [ ] Use Google **test ad unit IDs** and/or register your device as a **test device**.
- [ ] Debug with **Ad Inspector** (test devices only).

## 8. app-ads.txt
- [ ] Publish `app-ads.txt` on your **developer domain** (from the store listing); let Google crawl/verify it.

## 9. Go live
- [ ] Publish the app; ads serve once app-ads.txt is verified and the account is in good standing.

## Don't-get-suspended pitfalls
Clicking your own ads · testing on live ads · ads on loading/non-content screens · interstitial on launch/exit/mid-action · native not labeled "Ad" · skipping UMP in the EEA.
