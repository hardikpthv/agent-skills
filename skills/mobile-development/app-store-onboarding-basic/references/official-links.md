# Apple App Store — Official Links (source of truth)

**Always fetch the live page before relying on a specific value.** This list is the canonical set of official Apple URLs for each step. Apple's help site returns a "Page Not Found" page (not a 404 code) when a page moves. If you land on one, search `developer.apple.com/help/app-store-connect` for the current page.

## Program, account & compliance
- Enroll in the Apple Developer Program (fee, individual vs organization) — https://developer.apple.com/programs/enroll/
- Compare memberships — https://developer.apple.com/support/compare-memberships/
- D-U-N-S number (organizations) — https://developer.apple.com/support/D-U-N-S/
- Sign and update agreements (Paid Apps Agreement) — https://developer.apple.com/help/app-store-connect/manage-agreements/sign-and-update-agreements
- EU Digital Services Act trader requirements — https://developer.apple.com/help/app-store-connect/manage-compliance-information/manage-european-union-digital-services-act-trader-requirements
- App Store Small Business Program — https://developer.apple.com/app-store/small-business-program/

## Identifiers, signing & builds
- Register an App ID (bundle ID) — https://developer.apple.com/help/account/identifiers/register-an-app-id
- Certificates overview — https://developer.apple.com/help/account/certificates/certificates-overview
- Distributing your app for beta testing and releases (Xcode) — https://developer.apple.com/documentation/xcode/distributing-your-app-for-beta-testing-and-releases
- Upload builds — https://developer.apple.com/help/app-store-connect/manage-builds/upload-builds
- **Upcoming requirements: minimum Xcode/SDK (volatile, re-verify every time)** — https://developer.apple.com/news/upcoming-requirements/
- Privacy manifest files (`PrivacyInfo.xcprivacy`) — https://developer.apple.com/documentation/bundleresources/privacy-manifest-files
- Third-party SDK requirements (manifests & signatures) — https://developer.apple.com/support/third-party-SDK-requirements/
- Export compliance overview — https://developer.apple.com/help/app-store-connect/manage-app-information/overview-of-export-compliance
- Complying with encryption export regulations — https://developer.apple.com/documentation/security/complying-with-encryption-export-regulations

## App record & product page
- App Store Connect workflow — https://developer.apple.com/help/app-store-connect/get-started/app-store-connect-workflow
- Add a new app — https://developer.apple.com/help/app-store-connect/create-an-app-record/add-a-new-app
- App information reference (name, subtitle, category) — https://developer.apple.com/help/app-store-connect/reference/app-information
- Platform version information (description, keywords, promo text, review notes) — https://developer.apple.com/help/app-store-connect/reference/platform-version-information
- Screenshot specifications — https://developer.apple.com/help/app-store-connect/reference/screenshot-specifications
- App preview specifications — https://developer.apple.com/help/app-store-connect/reference/app-preview-specifications
- Manage your App Store assets (upload screenshots/previews) — https://developer.apple.com/help/app-store-connect/manage-app-information/upload-app-previews-and-screenshots
- App icons (HIG) — https://developer.apple.com/design/human-interface-guidelines/app-icons

## Privacy, rating & declarations
- App privacy details (nutrition labels) — https://developer.apple.com/app-store/app-privacy-details/
- Manage app privacy in App Store Connect — https://developer.apple.com/help/app-store-connect/manage-app-information/manage-app-privacy
- App Tracking Transparency — https://developer.apple.com/documentation/apptrackingtransparency
- Set an app age rating — https://developer.apple.com/help/app-store-connect/manage-app-information/set-an-app-age-rating
- Age rating values and definitions — https://developer.apple.com/help/app-store-connect/reference/age-ratings-values-and-definitions
- Accessibility Nutrition Labels — https://developer.apple.com/help/app-store-connect/manage-app-accessibility/overview-of-accessibility-nutrition-labels
- Offering account deletion in your app (5.1.1(v)) — https://developer.apple.com/support/offering-account-deletion-in-your-app/

## Testing, pricing & release
- TestFlight overview — https://developer.apple.com/help/app-store-connect/test-a-beta-version/testflight-overview
- Invite external testers — https://developer.apple.com/help/app-store-connect/test-a-beta-version/invite-external-testers
- Set a price — https://developer.apple.com/help/app-store-connect/manage-app-pricing/set-a-price
- Manage availability (countries/regions) — https://developer.apple.com/help/app-store-connect/manage-your-apps-availability/manage-availability-for-your-app-on-the-app-store
- Submit an app — https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app
- Overview of submitting for review — https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-for-review
- Release a version update in phases — https://developer.apple.com/help/app-store-connect/update-your-app/release-a-version-update-in-phases

## Monetization (In-App Purchase catalog)
- Overview for configuring In-App Purchases — https://developer.apple.com/help/app-store-connect/configure-in-app-purchase-settings/overview-for-configuring-in-app-purchases
- Create consumable / non-consumable IAPs — https://developer.apple.com/help/app-store-connect/manage-in-app-purchases/create-consumable-or-non-consumable-in-app-purchases
- Offer auto-renewable subscriptions — https://developer.apple.com/help/app-store-connect/manage-subscriptions/offer-auto-renewable-subscriptions
- Testing IAP with sandbox — https://developer.apple.com/documentation/storekit/testing-in-app-purchases-with-sandbox

## Review & policy
- App Review Guidelines — https://developer.apple.com/app-store/review/guidelines/
- App Review overview (turnaround, process) — https://developer.apple.com/app-store/review/
- Appeal a rejection (App Review Board) — https://developer.apple.com/contact/app-store/?topic=appeal

## Automation APIs (background; see the Pro skill)
- App Store Connect API — https://developer.apple.com/documentation/appstoreconnectapi
- Creating API keys — https://developer.apple.com/documentation/appstoreconnectapi/creating-api-keys-for-app-store-connect-api

---

## Volatile values to always re-verify

| Value | Where to confirm |
|-------|------------------|
| Minimum Xcode / SDK for uploads | upcoming-requirements |
| Program fee (and fee waivers) | programs/enroll |
| Required screenshot device classes & pixel sizes | screenshot-specifications |
| Character/byte limits | app-information + platform-version-information |
| Age-rating questions & tiers | set-an-app-age-rating |
| SDKs requiring privacy manifests/signatures | third-party-SDK-requirements |
| TestFlight tester caps & build expiry | testflight-overview |
| External payment / link-out rules (vary by storefront) | App Review Guidelines 3.1 |
| Accessibility Nutrition Labels: voluntary or required | accessibility nutrition labels overview |
| Review turnaround | app-store/review |
