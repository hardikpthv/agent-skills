# SEO audit methodology

SEO is technical foundation **plus** content quality. Automated checks find the deterministic technical/on-page issues; quality, intent, and authority need human judgment.

## Choose representative pages
Templates over count: home, a key category/landing template, a top article/product page, and one important conversion page. Plus check site-wide assets: robots.txt, sitemap, and the Search Console account.

## The layers (in order)
1. **Crawl & index** — Search Console is the source of truth. URL Inspection on key pages (indexed? Google-selected canonical? rendered HTML?), and the Pages report for excluded URLs and reasons.
2. **Technical** — robots.txt, sitemap health, canonicals, status codes/redirects, HTTPS, mobile parity, JS-rendered indexability. See [seo-checklist.md](seo-checklist.md).
3. **Core Web Vitals** — field data first (CrUX / PageSpeed Insights / GSC CWV report) since that's what counts; Lighthouse (lab) to diagnose causes.
4. **On-page** — titles, meta, headings, content, internal links, alt, intent.
5. **Structured data** — add/validate JSON-LD for eligible types; flag deprecated FAQ/HowTo reliance.

## Automated vs human
- **Automatable:** index status, titles/meta/headings, canonical/robots/sitemap presence, status codes, Lighthouse SEO + CWV, structured-data validation, missing alt, stray noindex. (The pro tier does these hands-on.)
- **Human judgment:** content quality & helpfulness, **search-intent** match, **E-E-A-T** (experience/authority/trust), keyword/topic strategy, and off-page link building. Surface these for the owner; don't pretend a crawler measured them.

## A note on AI search
AI Overviews / generative search are reducing organic clicks, especially on informational queries. Track **impressions** (and being cited), not only clicks, and write clear, extractable, authoritative content. Deeper guidance belongs in an `ai-seo` skill.

## Reporting
Group findings by layer (technical / CWV / on-page / structured data), mark severity and the specific page, give a concrete fix, and separate **confirmed issues** from **needs-human-review** (content/intent/E-E-A-T). Re-verify in Search Console after changes.

## Cadence
- Continuous: Search Console monitoring (coverage, CWV, performance).
- Per release: re-check changed templates for regressions (stray noindex, broken canonical, CWV).
- Quarterly: fuller on-page + content review.
