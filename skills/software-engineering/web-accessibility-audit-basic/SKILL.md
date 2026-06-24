---
name: web-accessibility-audit-basic
description: Use when auditing or reviewing a website or web app for accessibility (a11y) — checking WCAG 2.2 AA conformance, running an accessibility audit, or fixing issues like color contrast, missing alt text, form labels, keyboard navigation, visible focus, ARIA, headings/landmarks, or screen-reader support. Also for ADA / Section 508 / EN 301 549 / European Accessibility Act questions. Use whenever someone asks "is my site accessible," "do an a11y / WCAG audit," "accessibility review," "fix a11y issues," or mentions axe, Lighthouse accessibility, or screen readers.
---

# Web Accessibility Audit (Basic)

## Overview

Run a credible accessibility audit of a website against **WCAG 2.2 Level AA** — the current, legally-aligned target. This skill is the **map and the SOP**: what to check, how to check it, and the honest split between what a tool can find and what a human must.

**Core principle: automated tools catch only ~30–40% of WCAG issues.** A real audit is three layers — automated scan **+** manual testing **+** assistive-technology testing. Anyone selling "we ran a scanner, you're compliant" is wrong. Standards also evolve (WCAG 2.2 is current; 2.0's "4.1.1 Parsing" was removed) — **re-verify against [references/official-links.md](references/official-links.md)**.

This is the **Basic** tier: you *guide a human* through a structured audit. For a hands-on automated audit — driving a browser to run axe-core across pages, scripted keyboard checks, and a prioritized WCAG-referenced report — use `web-accessibility-audit-pro`.

## When to use

- "Is my site accessible?" / "Run a WCAG / a11y audit" / "accessibility review"
- Diagnosing contrast, alt text, labels, keyboard access, focus, ARIA, headings, or screen-reader issues
- ADA / Section 508 / EN 301 549 / European Accessibility Act (EAA) conformance questions
- Setting up an a11y testing process (CI scans + manual cadence)

**Not for:** native mobile app accessibility (different platform APIs), or general UX/design review unrelated to disability access.

## Learn this first: the standard

- **Target = WCAG 2.2 Level AA.** Levels are cumulative: **A** (minimum, insufficient alone) → **AA** (the practical & legal bar) → **AAA** (aspirational, not a blanket requirement).
- **POUR** — every criterion rolls up to **Perceivable, Operable, Understandable, Robust**.
- **WCAG 2.2** (2023, now ISO/IEC 40500:2025) added 9 criteria (focus visibility/appearance, dragging alternatives, target size, consistent help, redundant entry, accessible authentication) and **removed 4.1.1 Parsing** — don't flag it anymore.
- **Legal mapping:** ADA litigation and Section 508 effectively require WCAG AA; EN 301 549 / the EAA (enforced June 2025) align to WCAG AA. Auditing to 2.2 AA covers the 2.0/2.1 references most laws still cite.
- Native HTML first; **ARIA only when native semantics fall short** — bad ARIA is worse than none.

Full checklist: [references/wcag-2.2-checklist.md](references/wcag-2.2-checklist.md).

## The audit in three layers

A scan alone is not an audit. See [references/audit-methodology.md](references/audit-methodology.md).

1. **Automated scan (~30–40%)** — fast, deterministic failures: contrast, missing alt/labels, empty links/buttons, missing `lang`, invalid ARIA. Run axe-core / Lighthouse / Pa11y.
2. **Manual testing (~60–70%)** — keyboard-only navigation, logical focus & reading order, visible focus, heading/landmark structure, alt-text *quality*, reflow at 400% zoom, motion/reduced-motion, target size.
3. **Assistive-tech testing** — verify with a real screen reader (NVDA, VoiceOver, or JAWS): names/roles/states, error announcements, live regions.

## The big six (automatable quick wins)

Per the WebAIM Million, ~96% of detected errors are: **low-contrast text** (~84% of sites), **missing alt text**, **missing form labels**, **empty links**, **empty buttons**, **missing `lang`**. Fix these first — they're cheap and high-volume. Then move to the manual-only high-impact items: keyboard access, visible/!obscured focus, heading order, ARIA correctness, descriptive link text, accessible modals/widgets.

## Quick reference

| Item | Last-known detail (re-verify!) |
|------|--------------------------------|
| Target | **WCAG 2.2 Level AA** |
| Contrast | 4.5:1 normal text, 3:1 large text / UI components |
| Automated coverage | ~30–40% (rest is manual + AT) |
| Reflow | no loss at **400% zoom / 320 CSS px** |
| Target size | **24×24 CSS px** min (2.5.8, AA) |
| Removed in 2.2 | **4.1.1 Parsing** (don't flag) |
| Tools | axe-core, Lighthouse, Pa11y (automatable); NVDA/VoiceOver/JAWS (manual) |

## Common mistakes

- **Calling a scanner result "an audit"** — it covers a third of the criteria.
- **Trusting presence over quality** — alt text/labels/link text can exist but be meaningless.
- **Skipping keyboard + screen-reader testing** — where the highest-impact failures live.
- **ARIA misuse** — wrong roles, `aria-hidden` on focusable elements; native HTML first.
- **Forgetting focus** — invisible focus rings, or focus obscured behind sticky headers (new 2.4.11).
- **Auditing the homepage only** — test representative *templates* (form, article, widget-heavy page).
