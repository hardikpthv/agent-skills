# App Store Onboarding — Full Checklist

> Last-known values are marked **(verify)**. Fetch the matching link in `official-links.md` and confirm before relying on them. Apple reorganizes App Store Connect and changes requirements often; the *order* below is stable, the *specifics* are not.

## Phase A — Apple Developer Program (one-time, before any app)

1. **Apple Account** with **two-factor authentication** on. Use a long-lived account owned by the business, not a personal one that might leave.
2. **Enroll** at developer.apple.com (or the Apple Developer app). Choose **Individual** or **Organization**.
   - **Individual:** your legal name is shown as the seller on the store.
   - **Organization:** needs a legal entity, a **D-U-N-S number** (free, can take days to issue), a public website, and the authority to bind the org. The org name is shown as the seller. **A sole-founder LLC or company enrolls as an Organization** if it wants the company name shown; a sole proprietor without a registered entity enrolls as an Individual.
   - Whoever enrolls becomes the **Account Holder**, the only role that can accept agreements (including the Paid Apps Agreement). Make it the business owner, not a contractor; others can be added later with narrower roles.
3. **Pay the annual fee: US $99 (verify).** Fee waivers exist for eligible nonprofits, education, and government (verify).
4. Enrollment review can take time, especially for organizations. Don't promise same-day publishing.

## Phase B — Agreements, tax, banking & compliance (App Store Connect → Business)

5. The **Free Apps Agreement** is in place on enrollment. For **paid apps or any In-App Purchase**, the **Account Holder** must accept the **Paid Apps Agreement** and complete **tax forms** and **banking**. IAP products can't be sold until this is active.
6. **EU Digital Services Act trader status:** every account must declare whether it's a trader. Traders provide an address, phone, and email, which Apple verifies by code and **shows on the EU product page**. Without it the app can't be distributed in the EU. Requires the Admin role.
7. *(Optional)* Enroll in the **App Store Small Business Program** for the reduced commission rate (verify eligibility and rate).

## Phase C — Identifiers & signing (Certificates, Identifiers & Profiles)

8. **Register an explicit App ID** with the **bundle ID** (reverse-DNS, e.g. `com.example.app`) and enable the capabilities you use (Push, Sign in with Apple, App Groups, iCloud, etc.).
   > **Bundle ID is permanent:** once a build is uploaded you can't change the app's bundle ID. Choose carefully.
9. **Signing:** easiest is Xcode **Automatically manage signing** with the team selected. Manual signing needs an **Apple Distribution certificate** plus an **App Store provisioning profile**. Keep the certificate's private key backed up and out of git.

## Phase D — Create the app record (App Store Connect → Apps → +)

10. **New App:** platform(s), **name** (**30 chars (verify)**, must be unique on the store), **primary language**, **bundle ID** (from Phase C), **SKU** (internal, permanent, never shown to users), and user access.

## Phase E — Build & upload

11. **Toolchain:** build with the **minimum Xcode and SDK Apple currently requires**: **Xcode 26 + iOS/iPadOS 26 SDK since Apr 28 2026 (verify)**. Older toolchains are rejected at upload.
12. **Version & build:** set the marketing version (`CFBundleShortVersionString`) and a build number (`CFBundleVersion`) that increases with every upload.
13. **App icon:** 1024×1024 px in the asset catalog, no transparency (verify).
14. **Privacy manifest:** include `PrivacyInfo.xcprivacy` declaring tracking, collected data types, and **required-reason APIs**. Make sure every third-party SDK on Apple's list ships its own manifest **and signature**. Missing manifests are rejected at upload.
15. **Permission purpose strings:** every protected resource you request (camera, location, contacts, photos, tracking, etc.) needs a specific `NS…UsageDescription` explaining *why*. Vague strings get rejected under 5.1.1.
16. **Tracking:** if the app tracks users across other companies' apps/sites (including through ad SDKs), implement **App Tracking Transparency** and request permission before tracking.
17. **Export compliance:** most apps use only exempt encryption (HTTPS). Set `ITSAppUsesNonExemptEncryption` in Info.plist (usually `NO`) so you aren't asked on every build. If you use non-exempt encryption, provide the documentation.
18. **Upload:** Xcode → Product → **Archive** → **Distribute App** → App Store Connect. Alternatives are Transporter or a CI pipeline. Wait for processing to finish; Apple emails you about any issues.

## Phase F — TestFlight

19. **Internal testing:** up to **100 (verify)** App Store Connect team members, no review needed, available once the build is processed.
20. **External testing:** up to **10,000 (verify)** testers via email or a public link. The **first build of each version needs Beta App Review**. Provide test information: what to test, feedback email, and a demo account if login is gated.
21. Builds **expire after 90 days (verify)**. Run real-device testing here before you touch App Review.

## Phase G — Product page (App Store tab → version page)

22. **App information:** name, **subtitle (30 chars, verify)**, primary/secondary **category**, content rights declaration.
23. **Version text:**
    - **Description:** **4000 chars (verify)**, plain text, no HTML.
    - **Keywords:** **100 bytes (verify)**, comma-separated, no spaces needed. Don't repeat the app name or use other apps' or brands' names.
    - **Promotional text:** **170 chars (verify)**, editable any time without a new version.
    - **Support URL** (required), marketing URL (optional), copyright.
24. **Screenshots** (exact pixel sizes **verify** at screenshot-specifications):
    - **iPhone:** the **6.9" class is required**, e.g. **1320×2868** portrait (1290×2796 and 1260×2736 are also accepted). Apple scales it down for smaller iPhones.
    - **iPad** (if the app runs on iPad): the **13" class is required**, e.g. **2064×2752** or 2048×2732.
    - **1–10** per device class per localization, PNG or JPEG. They must show the real app.
25. **App previews** (optional): up to **3** per device class, short videos of real in-app footage (verify length/specs).

## Phase H — Privacy & declarations

26. **Privacy policy URL**: **required for every app**, even one that collects nothing.
27. **App Privacy ("nutrition labels"):** for each data type collected by you **or any SDK**, declare whether it's **linked to the user**, whether it's **used for tracking**, and its **purposes**. It must match the privacy manifest and the app's real behavior.
28. **Age rating:** answer the questionnaire honestly. Apple's tiers are **4+, 9+, 13+, 16+, 18+**, and Apple periodically **adds mandatory questions** (e.g. AI features, social features). Unanswered questions block submission (verify).
29. **As applicable:** Kids category (strict ads/analytics/data rules), regulated features (medical, financial, gambling, VPN, etc.), and **Accessibility Nutrition Labels** (voluntary for now, slated to become required; verify).

## Phase I — Pricing, availability & In-App Purchases

30. **Price:** free or a price point, with a base country/region. Unlike Google Play, you can change between free and paid later (verify). A paid price needs the Paid Apps Agreement (Phase B).
31. **Availability:** choose countries/regions. EU availability needs the trader status from Phase B.
32. **In-App Purchases** (needs an active Paid Apps Agreement):
    - Types: **consumable**, **non-consumable**, **auto-renewable subscription**, **non-renewing subscription**.
    - **Product IDs are permanent and can never be reused**, even after deletion.
    - Each product needs a reference name, price, localized display name/description, and an **App Review screenshot**.
    - **Subscriptions** live in a **subscription group**: users hold one subscription per group, and levels in the group define upgrades and downgrades. Add introductory/promotional offers as needed.
    - **Your first IAPs must be submitted together with an app version.**
    - **Sandbox testing:** create sandbox Apple Accounts (Users and Access → Sandbox) or use a StoreKit configuration file in Xcode for local testing.

For RevenueCat-managed purchases, this catalog is what RevenueCat links to. See a RevenueCat onboarding skill.

## Phase J — App Review & release

33. **App Review Information:** contact name/email/phone, a **working demo account** if any feature is behind login, and **notes (4000 bytes, verify)** explaining non-obvious features, hardware needs, or test steps.
34. **Select the build** for the version and confirm export compliance.
35. **Release option:** release **manually** after approval, **automatically**, or **after a date**. For later **version updates**, you can use a **phased release** (7 days; applies to automatic-update users only; can be paused). It doesn't apply to the first launch.
36. **Add for Review → Submit.** Most reviews finish within a day or two (verify), but first submissions and flagged apps can take longer. Watch App Store Connect for messages from App Review.

## Common rejections (fix before resubmitting)

- **2.1 App Completeness:** crashes, bugs, placeholder content, broken links, or a login-gated app with no demo account. (Most common.)
- **2.3 Accurate Metadata:** screenshots that don't show the real app, misleading descriptions, keyword stuffing, other brands' names in keywords.
- **4.2 Minimum Functionality:** a thin website wrapper, or too little native value.
- **4.3 Spam:** near-duplicate apps or template clones.
- **5.1.1 Data Collection:** vague purpose strings, data collected without need, or **no in-app account deletion** when the app has account creation.
- **5.1.2 / ATT:** tracking without App Tracking Transparency, or App Privacy labels that don't match behavior.
- **3.1.1 In-App Purchase:** unlocking digital content or features without IAP. Link-out / alternative payment rules **vary by storefront and have changed recently (verify)**.
- **4.8 Login Services:** offering only third-party social login without an equivalent privacy-preserving option (verify the current rule).

When rejected: read the **guideline number cited** in App Store Connect, fix that specific issue, **reply in App Store Connect** explaining the fix, and resubmit. If you believe the rejection is wrong, you can appeal to the App Review Board.
