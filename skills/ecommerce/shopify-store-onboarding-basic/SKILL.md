---
name: shopify-store-onboarding-basic
description: Use when setting up or launching a new Shopify store — creating the store, adding products (variants, media, pricing, inventory, SKUs), organizing collections, choosing and customizing a theme (Online Store 2.0), configuring payments (Shopify Payments), shipping, taxes, store policies, connecting a domain, and going live (removing the store password). Use whenever someone asks to "set up a Shopify store," "launch my Shopify shop," "add products to Shopify," "Shopify onboarding," "start selling on Shopify," or "go live on Shopify."
---

# Shopify Store Onboarding (Basic)

## Overview

Take a new store from signup to a live, sellable shop, following Shopify's own launch checklist. This skill is the **map and the SOP**: the correct order, the settings people forget, and the one step that keeps a "finished" store invisible (the password).

**Core principle: Shopify changes plans, pricing, the admin UI, and Payments availability constantly** (the mid-tier plan was recently renamed **Grow**, replacing "Shopify"). This skill carries *current* facts, but you **must re-verify against the live official page** — treat [references/official-links.md](references/official-links.md) as the source of truth. This is **not tax or legal advice**; the merchant is responsible for tax registration and policies.

This is the **Basic** tier: you *guide a merchant* through the admin. For hands-on setup — building the catalog, collections, pages, policies, and menus via the Shopify MCP / Admin API while the merchant handles account, billing, Payments, and domain — use `shopify-store-onboarding-pro`.

## When to use

- "Set up / launch my Shopify store" / "start selling on Shopify" / "go live"
- Adding products, variants, and collections; picking & customizing a theme
- Configuring payments, shipping, taxes, policies, and a custom domain

**Not for:** building Shopify **apps or custom themes from code** (that's developer work — see the official Shopify dev skills), deep platform migrations, or tax/legal advice.

## Learn this first: the model

- **Products → variants → collections.** A *product* has one set of details; **variants** are options of the same product (size/color), not duplicate products; **collections** group products — **manual** (you pick each) or **smart/automated** (rules like tag/price/type). _Collections need the Basic plan or above._
- **Product status: Active / Draft / Unlisted.** Draft = not published; Unlisted = reachable only by direct link.
- **Online Store 2.0 themes** — sections on every page, JSON templates, theme blocks; edit in the visual **theme editor** (browse the Theme Store for free/paid themes).
- **Payments** — **Shopify Payments** (native, no third-party transaction fee; country-dependent, needs identity + bank verification) or a **third-party gateway**. **Shop Pay** is the accelerated checkout on top.
- **Plans (2026): Starter · Basic · Grow · Advanced · Plus** (+ a free Agentic tier). Pricing is volatile — re-verify.
- **"Go live" = remove the store password.** Until then the store is hidden.

## First: re-verify the volatile bits

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| Plan names & pricing | Lineup changed ("Grow" replaced "Shopify") | shopify.com/pricing |
| Shopify Payments availability | Country-dependent; changes often | help.shopify.com payments/supported-countries |
| Shopify Tax | Availability + filing scope vary | help.shopify.com/taxes |
| Checkout & theme model | Checkout extensibility; `checkout.liquid` deprecated | help.shopify.com checkout-settings |

## The onboarding sequence

Follow **[references/launch-checklist.md](references/launch-checklist.md)** — Shopify's canonical order is **settings → storefront → test → launch**:

1. **Plan & store basics** — start a trial/plan; set store + legal business name, address, currency, weight unit, sender email.
2. **Shipping** — locations, delivery methods, rates/zones/profiles.
3. **Taxes** — configure for your jurisdictions (Shopify Tax where available).
4. **Payments** — activate Shopify Payments (identity + bank) or a gateway; take it out of test mode.
5. **Policies & pages** — refund, privacy, terms, shipping, contact (Shopify can generate templates — have them reviewed).
6. **Domain** — buy/connect a custom domain; set it primary.
7. **Theme** — pick and customize (replace all demo/placeholder content).
8. **Products** — add real products with media, pricing, inventory/SKUs, variants; set status Active.
9. **Collections & navigation** — group products; build menus and the homepage.
10. **Test** — place a successful *and* a failed test order; check fulfillment/refunds.
11. **Launch** — preview, then **remove the store password**.

## Prerequisites

Business/tax identity + a **bank account** (for Shopify Payments payouts), real **products**, a **domain**, and **legal policies**. Shopify Payments eligibility is country-dependent.

## Common mistakes

- **Forgetting to remove the store password** — the store stays invisible; nobody can buy.
- **Launching with placeholder theme content** — demo text, stock images, sample products.
- **No shipping rates** (or wrong zones) — checkout fails or overcharges.
- **Payments left in test mode / no payout bank** — orders can't be paid out.
- **Missing legal policies** (privacy, refund, terms).
- **Taxes not configured**; **thin catalog**; **no custom domain**.
- **Skipping a test order** before going live.
