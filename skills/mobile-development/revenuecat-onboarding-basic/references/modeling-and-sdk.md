# RevenueCat Modeling Conventions & SDK Integration

## Modeling best practices (RevenueCat-recommended)

- **One entitlement per access tier** (e.g. `pro`). Gate every premium feature on the entitlement, never on a specific product id.
- **Always attach products to an entitlement.** An unattached product means a paying user unlocks nothing — a silent revenue bug.
- **Control products remotely via Offerings/Packages.** Reference `offerings.current` in code so you can swap products, run price experiments, and reorder the paywall from the dashboard with **no app release**.
- **Use standard package identifiers** (`$rc_monthly`, `$rc_annual`, `$rc_weekly`, `$rc_lifetime`) so a package abstracts the iOS/Android/web equivalents of one offer.
- **Check access via `customerInfo.entitlements.active[...]`**, not raw receipts or product data.
- **Configure once, early, with the public key only.** Hybrid SDKs need a separate public key per platform. The v2 **secret** key is server/MCP-only — never ship it.
- **Use RevenueCat Paywalls tied to an Offering** for remote, code-free paywall changes (see the Pro skill).
- **Run webhooks + real-time notifications in production** for accurate, low-latency state; verify the webhook auth header and dedupe by event id.

## SDK integration shape (React Native example)

> Re-verify package name, version, and method signatures at the install/config links in `official-links.md` — these change between major SDK versions and differ for native (Swift/Kotlin) vs hybrid.

Install the core SDK (verify current requirements — e.g. iOS deployment target, min Android API, RN version):

```bash
npm install --save react-native-purchases
```

> The paywall UI package `react-native-purchases-ui` is **separate** — add it only if you use RevenueCat Paywalls (verify at the paywalls doc).

Configure once at app startup with the **platform-specific public key**:

```js
import { Platform } from 'react-native'
import Purchases from 'react-native-purchases'

Purchases.configure({
  apiKey: Platform.OS === 'ios' ? PUBLIC_APPLE_SDK_KEY : PUBLIC_GOOGLE_SDK_KEY,
  // appUserID: optional — pass your own stable user id to link purchases to your account system
})
```

Show the current offering's packages:

```js
const offerings = await Purchases.getOfferings()
const current = offerings.current            // the offering you marked "current" in the dashboard
const packages = current?.availablePackages ?? []
```

Purchase and check access:

```js
const { customerInfo } = await Purchases.purchasePackage(pkg)
const isPro = customerInfo.entitlements.active['pro'] !== undefined
```

Restore (required by the stores — surface a "Restore purchases" control):

```js
const customerInfo = await Purchases.restorePurchases()
const isPro = customerInfo.entitlements.active['pro'] !== undefined
```

React to changes anywhere in the app:

```js
Purchases.addCustomerInfoUpdateListener((customerInfo) => {
  const isPro = customerInfo.entitlements.active['pro'] !== undefined
  // update app state / unlock features
})
```

## Key principles in the code
- The app asks "**does the user have the `pro` entitlement?**" — it never inspects product ids or store receipts directly.
- The paywall renders from `offerings.current`, so product/price/order changes happen on the dashboard, not in a release.
- The public SDK key is the only RevenueCat credential in the client.
