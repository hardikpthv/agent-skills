# GTM onboarding checklist (ordered)

Work top to bottom. Re-verify each UI label against [official-links.md](official-links.md) — GTM renames things (notably the GA4 tag type).

## 1. Account + container
- Sign in at tagmanager.google.com → **Create Account**. Enter account name + country.
- Create a **container**: name it after the site's top URL (e.g. `www.example.com`), pick **Web**, accept ToS. Note the **container ID `GTM-XXXX`**.

## 2. Install the snippet (every page)
- **`<head>` part:** the `<script>` as high in `<head>` as possible, **below** any `dataLayer` declaration.
- **`<body>` part:** the `<noscript>` iframe immediately after the opening `<body>` tag.
- Put both on **every page** (template/layout). Replace `GTM-XXXX` with your ID.
- Remove any hardcoded tags you're migrating into GTM (avoids double-firing).

## 3. Data layer
- Declare `window.dataLayer = window.dataLayer || [];` **above** the GTM snippet.
- Push events/values your tags need, e.g. `dataLayer.push({ event: 'purchase', value: 49.0 });`. Detail: [tags-triggers-variables.md](tags-triggers-variables.md).

## 4. GA4 Google tag (the loader)
- New tag → type **Google tag** → enter your **Tag ID** → trigger **Initialization – All Pages / All Initialization Events** so it loads first.

## 5. Tags, triggers, variables
- Add **GA4 event tags** (type *Google Analytics: GA4 Event*), reference the Google tag, set an **Event Name** + trigger.
- Add Google Ads / conversion / pixel tags as needed.
- Enable the **built-in variables** you need (Click URL, Page Path, etc.); create user-defined variables for data-layer values.

## 6. Preview (don't skip)
- Click **Preview** → **Tag Assistant** opens connected to your site. Confirm the right tags fire, in the right order, with the right data-layer values.

## 7. Submit & Publish
- **Submit** → name the **version** → **Publish**. Nothing is live until this step. Versions are immutable; roll back by re-publishing an older one.

## 8. (Optional) Consent Mode v2 / server-side
- Configure **Consent Mode v2** (`ad_user_data`, `ad_personalization`) for EEA traffic.
- For server-side: a **server container** + a tagging server on **Cloud Run (~$45/mo)** or **App Engine (~$40/mo)** + a custom domain.

## Common pitfalls
- Forgot to **Publish** → changes never went live.
- Missing the `<body>` noscript or snippet not on all pages.
- `dataLayer` declared/pushed after the snippet → empty values when tags fire.
- GTM GA4 tag **and** a leftover hardcoded gtag → doubled metrics.
- EEA without Consent Mode v2.
