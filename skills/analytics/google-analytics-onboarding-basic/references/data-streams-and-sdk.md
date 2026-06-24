# Data streams, the events model & IDs

## Web vs mobile — the fork that matters

| | Web | Mobile (Android/iOS) |
|---|---|---|
| Collector | **Google tag (gtag.js)** or GTM | **Firebase SDK + Google Analytics** |
| Identifier | **Measurement ID `G-XXXXXXXXXX`** | **Firebase App ID** (from the linked Firebase project) |
| Config | snippet in `<head>` | `google-services.json` / `GoogleService-Info.plist` + SDK |
| Auto events | enhanced measurement (toggle, no code) | automatically collected app events |

GA for mobile **runs through Firebase** — creating an app data stream links a Firebase project, and the config file binds that app build to the GA4 property. There is no gtag.js path for native apps.

## The four event types
1. **Automatically collected** — fired by the tag/SDK with no setup (`first_visit`, `session_start`, `screen_view`, …).
2. **Enhanced measurement** (web only) — extra web interactions toggled in the UI, no code (scroll, outbound click, site search, file download, video, form interactions).
3. **Recommended** — predefined event names + parameters you implement to unlock specific reports (`purchase`, `login`, `sign_up`, …). Use the exact spec'd names or the reports stay empty.
4. **Custom** — your own names/parameters when nothing above fits. Avoid reserved prefixes (`ga_`, `google_`, `firebase_`).

Gate analysis on **events + parameters**, never on URLs.

## Key events (formerly Conversions)
A **key event** is an event you've marked as important to the business; it surfaces across GA4 reports. A Google **Ads conversion** is created *from* a key event and used for bidding. Renamed from "Conversions" on **2024-03-21**; existing ones auto-migrated, history preserved. Mark key events in **Admin → Key events** — if you skip this, no conversions register.

## IDs at a glance
- **Measurement ID** `G-XXXXXXXXXX` — the web stream's gtag ID (goes in the tag/CMS field).
- **Stream ID** — numeric internal ID of any stream (used by some APIs/configs).
- **Firebase App ID** — per-app ID from the linked Firebase project (mobile only).

## Server-side events
For backend/offline events (e.g. a purchase confirmed on your server), use the **Measurement Protocol** (GA4): an HTTPS POST with an `api_secret` you create under the data stream. Keep the `api_secret` **server-side** — never ship it in client code or paste it into chat.
