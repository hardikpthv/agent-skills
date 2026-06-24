# Tags, triggers, variables & the data layer

## The data layer (the foundation)
`window.dataLayer` is a JS array GTM reads from. Declare it **above** the GTM snippet so values exist when tags fire:

```html
<script>
  window.dataLayer = window.dataLayer || [];
  dataLayer.push({ event: 'login', method: 'google' });
</script>
<!-- GTM snippet goes below this -->
```

- A push can carry an **`event`** (which fires Custom Event triggers) plus any parameters.
- Push **before** the action's tag needs the data; late pushes arrive after tags fire.
- User-defined **Data Layer Variable**s read individual keys (e.g. `value`, `method`).

## Tags
Code GTM fires on your behalf:
- **GA4 Google tag** — the loader/config (Tag ID). Fires first, on **Initialization**.
- **GA4 event tag** — *Google Analytics: GA4 Event*; an Event Name + params, referencing the Google tag. Reuse params across events with a **Google Tag Event Settings** variable.
- **Google Ads**, conversion, remarketing, and third-party **pixels** — same pattern: tag + trigger.

## Triggers
The condition that fires a tag:
- **Initialization / All Pages** — load the GA4 Google tag first.
- **Page View**, **Click** (All Elements / Just Links), **Form Submit**, **Scroll**, **Element Visibility**.
- **Custom Event** — matches a `dataLayer.push({ event: '…' })`.
Add conditions (e.g. fire only when Page Path contains `/checkout`).

## Variables
Reusable values:
- **Built-in** — toggle on (Page URL, Page Path, Click ID, Click Classes, etc.).
- **User-defined** — Data Layer Variable, Constant, Lookup Table, JavaScript, etc.
Variables keep tags/triggers DRY and data-driven.

## Templates, environments, versions
- **Community Template Gallery** — import vetted tag/variable templates instead of custom HTML.
- **Environments** — named publish targets (e.g. staging vs production) to test a version before prod.
- **Versions** — every publish snapshots an immutable version; roll back by re-publishing an older one.

## Server-side (when you outgrow client-side)
A **server container** runs on a tagging server (Cloud Run ~$45/mo or App Engine ~$40/mo) under your own domain, moving tag processing off the browser for performance, data control, and resilience to ad blockers. It adds GCP setup + ongoing cost/ops — adopt it deliberately, not by default.

## Consent Mode v2
For EEA traffic, GTM must pass consent signals: v2 adds `ad_user_data` + `ad_personalization` on top of `ad_storage` / `analytics_storage`. **Basic** blocks tags until consent; **Advanced** loads tags that send cookieless pings pre-consent. Configure via GTM consent settings + each tag's consent checks, wired to your CMP.
