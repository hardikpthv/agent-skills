---
name: web-seo-audit-basic
description: Use when auditing or improving a website's SEO — technical SEO (crawlability, robots.txt, XML sitemaps, canonical tags, noindex, redirects, mobile-first, HTTPS), Core Web Vitals (LCP, INP, CLS), on-page SEO (titles, meta descriptions, headings, content, internal links, alt text), and structured data (Schema.org JSON-LD). Use whenever someone asks to "do an SEO audit," "improve my SEO," "why isn't my site ranking," "check my site for SEO," "technical SEO," "Core Web Vitals," "add schema markup," or "SEO support for my website."
---

# Web SEO Audit (Basic)

## Overview

Audit and improve a website's SEO across the four layers that actually move rankings. This skill is the **map and the SOP**: what to check, in what order, and where the line is between "make it crawlable/indexable" and "make it rank."

**Core principle: Google changes algorithms, guidance, and rich-result support constantly.** This skill carries *current* facts (Core Web Vitals thresholds, the FAQ/HowTo rich-result deprecation), but you **must re-verify against the live official page** — treat [references/official-links.md](references/official-links.md) as the source of truth. And remember: technical SEO is the *foundation*, but **relevance and content quality dominate ranking** — a perfect audit won't rank thin content.

This is the **Basic** tier: you *guide a human* through the audit. For a hands-on automated audit — crawling pages, running Lighthouse, validating structured data, and producing a prioritized report — use `web-seo-audit-pro`.

## When to use

- "Do an SEO audit" / "improve my SEO" / "why isn't my site ranking?"
- Technical SEO: crawl/index issues, robots.txt, sitemaps, canonicals, redirects, mobile-first, HTTPS
- Core Web Vitals (LCP, INP, CLS); on-page (titles, meta, headings, content, links, alt)
- Structured data (Schema.org JSON-LD) and rich-result eligibility

**Not for:** paid search/SEM, deep keyword research & content strategy (a content/keyword skill), link building, or AI-search optimization (see an `ai-seo` skill for getting cited by AI Overviews).

## Learn this first: the four layers

Rank only happens after a page is **crawlable → indexable → relevant**. Work in this order:

1. **Technical** — can Google crawl and index it? robots.txt (not an index control — use `noindex`), sitemaps, canonicals, status codes, mobile-first, HTTPS, JS rendering.
2. **Core Web Vitals** — page-experience signals (real but minor; a tiebreaker, not a savior).
3. **On-page** — titles, meta descriptions, headings, content quality (Helpful Content / E-E-A-T), internal links, alt text, intent match.
4. **Structured data** — Schema.org JSON-LD for eligible rich results.

Full checklist: [references/seo-checklist.md](references/seo-checklist.md).

## First: re-verify the volatile bits

| What | Why it bites | Re-verify |
|------|--------------|-----------|
| Core Web Vitals thresholds | Numbers + which metrics drift (INP replaced FID in 2024) | web.dev/articles/vitals |
| **FAQ / HowTo rich results** | **Deprecated** — no longer earn rich snippets; don't promise them | developers.google.com/search structured-data gallery |
| robots.txt as "noindex" | A blocked-but-linked URL can still be indexed; use `noindex` | Search Central block-indexing docs |
| Helpful Content / spam policies | Merged into core (2024); scaled-content & site-reputation abuse | Search Central helpful-content docs |

## The audit sequence

Follow [references/audit-methodology.md](references/audit-methodology.md). The phases:

1. **Crawl & index check** — Google Search Console URL Inspection + Pages report; confirm key pages are indexed and no stray `noindex`/robots block.
2. **Technical pass** — robots.txt, sitemap submitted & clean, canonicals self-referencing/correct, status codes (301s not chains, no soft 404s), HTTPS, mobile parity.
3. **Core Web Vitals** — PageSpeed Insights / CrUX field data; fix LCP, INP, CLS offenders.
4. **On-page pass** — unique descriptive titles, meta descriptions, one H1 + logical headings, content quality/intent, internal links, image alt.
5. **Structured data** — add valid JSON-LD for eligible types; validate; don't rely on deprecated FAQ/HowTo snippets.
6. **Verify & monitor** — re-check in Search Console; track impressions/clicks/position over time.

## Core Web Vitals (re-verify!)

| Metric | Good | Poor |
|--------|------|------|
| **LCP** (loading) | ≤ 2.5 s | > 4.0 s |
| **INP** (responsiveness, replaced FID) | ≤ 200 ms | > 500 ms |
| **CLS** (visual stability) | ≤ 0.1 | > 0.25 |

## Common mistakes

- **`noindex` or robots `Disallow` left in production** after launch/staging — invisible to Google.
- **Blocking CSS/JS in robots.txt** — Google can't render the page.
- **Missing/incorrect canonical** — pointing to a redirected/404/noindexed URL, or none at all.
- **Slow LCP / poor INP / layout shift** from unsized images and injected content.
- **Thin or keyword-stuffed content** — Helpful Content risk; write for people.
- **JS-rendered content/links not in the rendered HTML** — not indexable; prefer SSR/SSG or verify with URL Inspection.
- **Relying on FAQ/HowTo rich results** — deprecated; the markup is fine but earns no snippet.
- **Duplicate/non-descriptive titles**, missing alt text, no sitemap.
