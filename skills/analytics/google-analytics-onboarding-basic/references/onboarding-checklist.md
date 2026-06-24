# GA4 onboarding checklist (ordered)

Work top to bottom. Re-verify each UI path against [official-links.md](official-links.md) — the Admin panel moves and relabels often.

## 1. Google Analytics account
- Sign in at analytics.google.com → **Start measuring** (first time) or **Admin → Create → Account**.
- Name the account; set data-sharing options. One account = one organization/company.

## 2. Property
- **Admin → Create → Property.**
- Set **reporting time zone** and **currency** (not retroactive — get them right now), industry, business size/objective; accept ToS.
- One property per product/brand. Don't split platforms into separate properties.

## 3. Data stream
- **Admin → Data streams → Add stream.**
- **Web:** enter the site URL + a stream name. **Enhanced measurement is ON by default.** Copy the **Measurement ID `G-XXXXXXXXXX`**.
- **App (Android/iOS):** choose the platform; GA **auto-creates/links a Firebase project**. Enter the package name (Android) / bundle ID (iOS) + app name. Download **google-services.json** / **GoogleService-Info.plist**.

## 4. Install collection (pick ONE delivery path per stream)
- **Web — Google tag:** paste the gtag.js snippet immediately after `<head>` on every page.
- **Web — GTM:** add a Google tag / GA4 configuration in your container instead (don't also hard-code gtag for the same property → double-counting).
- **Web — CMS:** paste the Measurement ID into your platform's GA field (WordPress / Shopify / etc.).
- **Mobile:** add the config file to the app, add the **Firebase SDK with the Analytics module** (Android: Firebase BoM + `firebase-analytics`; iOS: add the Analytics Swift Package in Xcode), build and run.

## 5. Events
- Leave **enhanced measurement** on (web) — it auto-collects scrolls, outbound clicks, site search, file downloads, video, form interactions.
- Add **recommended** events (e.g. `purchase`, `login`, `sign_up`) and **custom** events for actions you care about. Detail: [data-streams-and-sdk.md](data-streams-and-sdk.md).

## 6. Key events
- **Admin → Events / Key events** → mark the business-critical events as **key events** (the renamed "Conversions"). Without this, conversions stay empty in GA4 and Ads.

## 7. Settings & compliance
- **Data retention:** set user/event retention to **14 months** (default is 2). Admin → Data collection and modification → Data retention.
- **Consent Mode v2:** if you have EEA users, configure consent signals (`ad_user_data`, `ad_personalization`) via your CMP / GTM.

## 8. Verify (don't skip)
- Trigger some traffic/events, then confirm in the **Realtime** report and **DebugView**. Realtime/DebugView show within seconds–minutes; standard reports can lag up to ~24–48h.

## 9. (Optional) Product links
- **Admin → Product links:** Google Ads (audiences/conversions), BigQuery (raw export), Search Console (organic queries).

## Common pitfalls
- Mobile set up with gtag.js instead of Firebase → no data.
- gtag + GTM both firing → doubled metrics.
- Retention left at 2 months → short history in Explorations.
- Key events not marked → empty conversions.
- EEA without Consent Mode v2 → audiences/ads data loss.
