# SEO checklist (audit against this)

Re-verify volatile items against [official-links.md](official-links.md). Order: technical → CWV → on-page → structured data.

## 1. Technical (crawlable & indexable)
- [ ] **Indexed?** Google Search Console → URL Inspection on key pages; Pages report for excluded URLs + reasons.
- [ ] **robots.txt** present, doesn't block CSS/JS or important URLs. (It's not an index control — use `noindex`.)
- [ ] **XML sitemap** exists, submitted in GSC, lists only canonical 200-OK URLs (no noindex/404/redirects).
- [ ] **Canonical** tag on each page — self-referencing unless intentionally consolidating; never points to a 404/redirect/noindexed URL.
- [ ] **No stray `noindex`** / `X-Robots-Tag: noindex` left from staging.
- [ ] **Status codes & redirects** — 301 for moves (no chains/loops), no soft 404s, HTTP→HTTPS redirect, no mixed content.
- [ ] **Mobile-first** — mobile and desktop have content/metadata/structured-data parity.
- [ ] **JS rendering** — critical content + links present in the rendered HTML (verify in URL Inspection "view rendered HTML").
- [ ] **hreflang** (international) — reciprocal, self-referencing, with `x-default`.

## 2. Core Web Vitals (re-verify thresholds)
- [ ] **LCP ≤ 2.5 s** — optimize the largest element (hero image/text), preload, fast server.
- [ ] **INP ≤ 200 ms** (replaced FID) — reduce long tasks / heavy JS on interaction.
- [ ] **CLS ≤ 0.1** — set width/height on media, reserve space for injected content.
- Use field data (CrUX/PageSpeed Insights/GSC CWV report); lab (Lighthouse) for diagnosis.

## 3. On-page
- [ ] **Title** — unique, descriptive, topic front-loaded, ~50–60 chars.
- [ ] **Meta description** — unique, compelling, ~150–160 chars (affects CTR, not ranking).
- [ ] **One `<h1>`** + logical `<h2>/<h3>` hierarchy used semantically.
- [ ] **Content** — helpful, original, people-first; matches search intent; demonstrates E-E-A-T (esp. Trust). No keyword stuffing.
- [ ] **Internal links** — descriptive anchors; key pages reachable; equity flows to priorities.
- [ ] **Images** — descriptive `alt`, compressed/next-gen format, explicit dimensions.
- [ ] **URLs** — readable, lowercase, hyphenated, stable.

## 4. Structured data (Schema.org JSON-LD)
- [ ] Add valid **JSON-LD** for eligible types: Article, Product, BreadcrumbList, Organization, LocalBusiness, Review, Event, Recipe, Video, etc.
- [ ] Markup represents **visible** content; no hidden/misleading data.
- [ ] **Validate** with the Rich Results Test + Schema validator.
- [ ] ⚠️ **FAQ & HowTo are deprecated as rich results** — the markup stays valid but earns **no** rich snippet; don't promise it.

## Verify & monitor
- Re-check in Search Console after fixes; track impressions, clicks, CTR, and average position over time.
