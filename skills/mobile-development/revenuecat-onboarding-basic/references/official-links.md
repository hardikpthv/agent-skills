# RevenueCat — Official Links (source of truth)

**Always fetch the live page before relying on a specific version, method, or value.** RevenueCat occasionally reorganizes its docs; on a 404, search from the docs home. Prefer the canonical `/docs/...` paths below.

## Getting started
- Docs home — https://www.revenuecat.com/docs/
- Quickstart (end-to-end) — https://www.revenuecat.com/docs/getting-started/quickstart
- Projects / setup — https://www.revenuecat.com/docs/projects/overview

## Store connection (Google Play)
- Google Play service credentials — https://www.revenuecat.com/docs/service-credentials/creating-play-service-credentials
- Google Play credential checklists — https://www.revenuecat.com/docs/service-credentials/creating-play-service-credentials/google-play-checklists

## Store connection (App Store / Apple)
- App Store credentials (In-App Purchase Key / App Store Connect API key) — start at the Service Credentials section: https://www.revenuecat.com/docs/service-credentials and follow the App Store / iOS guide (verify the exact page; RevenueCat reorganizes this area)

## Modeling: products, entitlements, offerings
- Products overview — https://www.revenuecat.com/docs/offerings/products-overview
- Entitlements — https://www.revenuecat.com/docs/getting-started/entitlements
- Offerings & packages — https://www.revenuecat.com/docs/offerings/overview
- Displaying products (offerings in code) — https://www.revenuecat.com/docs/getting-started/displaying-products

## SDK
- Configuring the SDK / API keys — https://www.revenuecat.com/docs/getting-started/configuring-sdk
- **SDK install — React Native (volatile: versions/requirements)** — https://www.revenuecat.com/docs/getting-started/installation/reactnative
- Customer info / entitlement status — https://www.revenuecat.com/docs/customers/customer-info

## Paywalls
- Paywalls — https://www.revenuecat.com/docs/tools/paywalls

## Production reliability
- Webhooks — https://www.revenuecat.com/docs/integrations/webhooks
- Google Play real-time developer notifications (Pub/Sub) — https://www.revenuecat.com/docs/platform-resources/server-notifications/google-server-notifications

## Testing
- Sandbox testing (Google Play) — https://www.revenuecat.com/docs/test-and-launch/sandbox/google-play-store
- Sandbox overview — https://www.revenuecat.com/docs/test-and-launch/sandbox

## Automation (see the Pro skill)
- RevenueCat MCP server — https://www.revenuecat.com/docs/tools/mcp

---

## Volatile things to always re-verify
| Value | Where to confirm |
|-------|------------------|
| SDK version & platform requirements (deployment target, min API, RN version) | installation/reactnative link |
| Purchase/restore/customerInfo method signatures | configuring-sdk link |
| Google service-account roles & the Cloud Console flow | service-credentials link |
| Credential propagation delay (last-known ~36h) | service-credentials link |
| Webhook retry schedule & timeout | webhooks link |
| Sandbox renewal cadence & testing track rules | sandbox/google-play-store link |
