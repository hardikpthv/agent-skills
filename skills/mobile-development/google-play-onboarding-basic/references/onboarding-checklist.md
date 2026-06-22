# Google Play Onboarding — Full Checklist

> Last-known values are marked **(verify)** — fetch the matching link in `official-links.md` and confirm before relying on them. Google reorganizes the Console UI and changes requirements frequently; the *order* below is stable, the *specifics* are not.

## Phase A — Developer account (one-time, before any app)

1. **Register** at the Play Console. Choose **Personal** or **Organization**.
2. **Pay the one-time registration fee** — **US $25 (verify)**. Accept the Developer Distribution Agreement.
3. **Complete identity verification:** valid government ID + a credit card in your legal name. **Organizations** additionally need a **D-U-N-S number** and business verification. (Personal accounts may need to verify device access via the Play Console mobile app.)
4. Note: account verification can take time. Don't promise same-day publishing.

## Phase B — Create the app

5. Play Console → **Create app**. Set: default language, app name (**30 chars (verify)**), app vs. game, free vs. paid, contact email.
6. Accept declarations (Developer Program Policies, US export law, Play App Signing terms).

> **Free vs. paid is one-way:** an app set to free can never become paid. If unsure, you can launch free and monetize via in-app products/subscriptions instead.

## Phase C — Main store listing

7. **Text:** app name, short description (**80 chars (verify)**), full description (**4000 chars (verify)**). Write for users, not keyword stuffing (see Common rejections).
8. **Category & contact details.**
9. **Graphic assets** (all dims **verify** at the asset-specs link):
   - **App icon:** 512×512 px, 32-bit PNG with alpha, ≤1024 KB.
   - **Feature graphic:** 1024×500 px, JPEG or 24-bit PNG (no alpha). Required to publish.
   - **Phone screenshots:** 2–8; each side 320–3840 px; longest side ≤ 2× shortest. For store-promotion eligibility, provide ≥4 at ≥1080 px in 16:9 or 9:16.
   - **Tablet (7"/10") & Chromebook screenshots:** up to 8 each; 1080–7680 px.
   - **Promo video (optional):** a public/unlisted YouTube URL, ads off, embeddable, not age-restricted.

## Phase D — App content declarations (Policy → App content)

All of these are mandatory to publish. Missing or inaccurate declarations are a top rejection cause.

10. **Privacy policy** — a live URL is **required even if the app collects no data**.
11. **App access** — declare whether any part is login-restricted; if so, give the reviewer working credentials/instructions.
12. **Ads** — declare whether the app shows ads (including third-party SDK ads).
13. **Content rating (IARC questionnaire)** — provide email, pick a category, answer the questionnaire; ratings are generated and applied. Without it the app shows "Unrated."
14. **Target audience & content** — declare target age groups (do **App access** and **Ads** first). Targeting children triggers Families policy / Designed for Families.
15. **Data safety** — declare data collected/shared, purposes, security practices (encryption in transit, deletion). Must match the app's actual behavior; mismatches get apps pulled.
16. **As applicable:** Permissions Declaration Form (sensitive/high-risk permissions), plus News, Health, Financial features, Government, etc.

## Phase E — Pricing & distribution

17. Set **pricing** (free/paid) and select **countries/regions**.

## Phase F — App signing & build

18. **Play App Signing** — auto-enrolled on first upload. Google holds the **app signing key**; you keep the **upload key** safe (you sign uploads with it). Losing the upload key is recoverable via Google support; losing your only key without Play App Signing historically was not — which is why Play App Signing is mandatory.
19. **Build an AAB** (Android App Bundle). **APKs are not accepted for new apps (verify).** Ensure the build's **targetSdkVersion meets the current requirement (verify)**.
20. If the app sells in-app products/subscriptions, the bundle must declare the **`com.android.vending.BILLING`** permission *before* you can create products (see Phase H).

## Phase G — Testing tracks → production

21. Upload the AAB to a track. Promote in order: **Internal testing** (up to 100 testers, **verify**) → **Closed testing** → **Open testing** → **Production**.
22. **New personal accounts (created after the cutoff, verify):** must run **closed testing with the required number of opted-in testers for the required number of days (verify exact count/days)** before you can **Apply for production**. Plan for this lead time. Testers must be *separate, real opted-in Google accounts* (recruit via an email list or Google Group) — you cannot count your own account.
23. Create a **production release**: upload the AAB, add release name + release notes (≤500 chars/language, **verify**), resolve all errors, choose rollout %.
24. **Submit for review.** Review is typically up to ~7 days (**verify**) and can be longer for new accounts. You cannot start a new release while one is in review.

## Phase H — In-app products & subscriptions (Monetize with Play → Products)

> Precondition: an app bundle with the **`com.android.vending.BILLING`** permission must already be uploaded.

- **In-app products** (one-time/consumable/non-consumable): create product ID (immutable, non-reusable; lowercase letters/numbers/`_`/`.`), set price, **activate**.
- **Subscriptions** have three layers, set in order: **Subscription** (the benefit) → **Base plan** (billing period, renewal type, price) → **Offers** (optional discounts). Activate base plans/offers to make them purchasable.
- **License testing:** add license testers (Setup → License testing) so test accounts get test purchases without real charges; sandbox renewals run on accelerated cycles.

For RevenueCat-managed purchases, this catalog is what RevenueCat imports/links to — see a RevenueCat onboarding skill.

## Common rejections (fix before resubmitting)

- **Metadata violations** — misleading/keyword-stuffed/irrelevant title, icon, description, or screenshots; promo text in metadata. (Most common.)
- **Deceptive behavior** — impersonating other apps, misrepresenting functionality, hidden features.
- **Data safety mismatch** — declared practices don't match actual data handling.
- **Privacy policy** — missing, broken, or not applicable to the app.
- **Sensitive permissions** — requested without justification or an approved Permissions Declaration Form.
- **Broken/incomplete functionality or crashes** at review; placeholder content.
- **IP/impersonation** — using brands or assets you don't own.

When rejected: read the **specific policy named in the enforcement email**, fix that, then resubmit. Repeated violations can escalate to account suspension.
