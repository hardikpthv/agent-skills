# RevenueCat Onboarding — Full Checklist

> Last-known values are marked **(verify)** — fetch the matching link in `official-links.md` and confirm. The *order* is stable; SDK versions, method names, and the Google credential UI are not.

## Phase 1 — Create the project
1. RevenueCat dashboard → Projects → **Create new project**.
2. Every new project ships with a pre-provisioned **Test Store**, so you can build and test the SDK before connecting Apple/Google.

## Phase 2 — Add an app
3. Project Settings → **Apps** → choose the platform (**Play Store**, App Store, Amazon, Stripe, RC Billing…). Name is required.
4. You can add multiple platform apps to one project (e.g. Android + iOS sharing entitlements/offerings).
5. iOS additionally needs an In-App Purchase Key; Android needs the Play service-account credentials (next). For iOS, follow RevenueCat's App Store credential guide (see `official-links.md`) — it's the same human-owned store-auth pattern.

## Phase 3 — Connect Google Play credentials
> Needed so RevenueCat can validate purchases and receive status. Full step-by-step is in the Pro skill; the shape:
6. In **Google Cloud Console**, enable: **Google Play Android Developer API**, **Play Developer Reporting API**, and (for real-time notifications) **Pub/Sub API**.
7. Create a **service account**, grant the roles RevenueCat documents (e.g. Pub/Sub + monitoring for notifications), and **download its JSON key**.
8. In **Google Play Console → Users and permissions**, invite the service account email with the documented permissions (view app info, view financial data, manage orders & subscriptions).
9. **Upload the JSON** in RevenueCat → the Play app's Service credentials.
10. **Propagation: up to ~36 hours (verify)** — "Invalid Play Store credentials" during this window is expected. RevenueCat also offers an automated Cloud Shell script as an alternative to the manual flow.

## Phase 4 — Configure products
11. **Import** existing store products or create products in RevenueCat. Products are the actual store SKUs (these must exist / be created in the store — see a Google Play skill for the Play catalog).

## Phase 5 — Entitlements
12. Create an entitlement (e.g. `pro`) — a named access level.
13. **Attach products** to the entitlement so purchases unlock it. One product can unlock multiple entitlements and vice-versa.

## Phase 6 — Offerings & packages
14. Create an **Offering** (a set of packages shown together).
15. Add **Packages** using standard duration ids (`$rc_monthly`, `$rc_annual`, `$rc_weekly`, `$rc_lifetime`, or custom). A package groups the equivalent product across platforms.
16. Mark one offering **Current/Default** — the SDK's `getOfferings()` returns it as `current`.

## Phase 7 — SDK API keys
17. Project Settings → **API keys** → app-specific **public** SDK keys. Hybrid SDKs (React Native/Flutter) need a **separate public key per platform** (iOS vs Android). Never use the v2 **secret** key in the client.

## Phase 8 — Integrate the SDK
18. Install the SDK (e.g. `react-native-purchases`; the separate `react-native-purchases-ui` package adds optional paywall UI) and **configure once, early**, with the platform-specific public key.
19. Fetch offerings (`getOfferings()` → use `current`), purchase (`purchasePackage()`), restore (`restorePurchases()`), and check access via `customerInfo.entitlements.active[...]`.
Detail + code shape: `modeling-and-sdk.md`. **Re-verify versions/methods at the install/config links** — they change.

## Phase 9 — Webhooks (production reliability)
20. Register an HTTPS webhook endpoint (with an Authorization header) so your backend learns about purchases/renewals/cancellations.
21. For Google Play, also set up **Real-time Developer Notifications** via Pub/Sub (the dashboard gives you a topic id to paste into Play Console). Improves accuracy and latency. (Pro skill has details.)
22. Verify the auth header and **dedupe by event id** (idempotency); RevenueCat retries failed deliveries (last-known: up to 5 retries at 5/10/20/40/80 min, expects a 200 within 60s — verify).

## Phase 10 — Test in sandbox
23. Google Play: add **license testers**, publish to a **closed testing** track, opt testers in, and test with a single licensed account. Sandbox subscriptions renew on an accelerated schedule (verify cadence).
24. Confirm the full loop: see offerings → purchase → entitlement becomes active → restore works → webhook fires.
