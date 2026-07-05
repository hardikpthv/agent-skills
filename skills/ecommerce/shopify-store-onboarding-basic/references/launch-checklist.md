# Shopify launch checklist (ordered)

Shopify's canonical order: **settings → storefront → test → launch**. Re-verify UI paths against [official-links.md](official-links.md).

## Settings first
- [ ] **Plan / trial** — start a plan (Starter / Basic / Grow / Advanced / Plus). Re-verify names + pricing.
- [ ] **Password-protect** the store so it stays hidden while you build.
- [ ] **Business settings** — store name + legal business name, address, billing, default currency, weight unit.
- [ ] **Sender email + authentication** (so store emails deliver).
- [ ] **Shipping** — locations, delivery methods, rates, zones, profiles.
- [ ] **Markets** — if selling internationally (per-market currency/pricing needs Shopify Payments).
- [ ] **Taxes** — configure for your jurisdictions (Shopify Tax where available). _Merchant owns tax compliance._
- [ ] **Payments** — activate **Shopify Payments** (identity + bank verification, 2FA) or a third-party gateway. Take it **out of test mode** before launch.
- [ ] **Store policies** — refund/return, privacy, terms of service, shipping (Shopify can generate templates — have them reviewed).
- [ ] **Customer accounts** setting; **checkout** settings.
- [ ] **Domain** — buy/connect a custom domain; set it primary.

## Build the storefront
- [ ] **Theme** — pick one; customize in the theme editor; **replace all demo/placeholder content**.
- [ ] **Products** — add real products: title, description, media, price, inventory/SKU, variants; set **status = Active**.
- [ ] **Collections** — group products (manual or smart). _Requires Basic+._
- [ ] **Navigation** — build header/footer menus and the homepage sections.
- [ ] Optional: blog, extra pages, apps, more sales channels.

## Test
- [ ] Place a **successful** test order and a **failed** one; test refunds/cancels and fulfillment; review fraud analysis.

## Launch
- [ ] **Preview** the store end to end.
- [ ] **Remove the store password** → the store goes live.

## Post-launch
- [ ] Add sales channels (Shop, Google/YouTube, Meta, TikTok, Buy Button, POS), SEO/sitemap, marketing.

## Don't-skip pitfalls
Password left on · payments in test mode / no payout bank · no shipping rates · missing policies · placeholder content · no domain · no test order.
