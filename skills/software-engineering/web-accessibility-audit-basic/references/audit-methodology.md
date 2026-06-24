# Audit methodology: automated + manual + assistive-tech

A scan is a starting point, not an audit. Roughly **30–40%** of WCAG issues are machine-detectable; the rest need a human.

## Choose representative pages
Breadth of *templates* beats page count. Audit: the home page, a content template (article/product), a **form** page (signup/contact/checkout), and an **interactive/widget-heavy** page (modals, menus, carousels).

## Layer 1 — Automated scan (~30–40%)
Run an axe-core–based tool on each page:
- **axe DevTools** / **axe-core** (browser or CI), **Lighthouse** (quick score), **Pa11y** (CLI/sitemap), **Accessibility Insights FastPass**.
- Catches: contrast, missing alt/labels, empty links/buttons, missing `lang`, duplicate IDs, invalid ARIA.
- axe returns uncertain items as **"incomplete"** — those are manual-review, not passes.

## Layer 2 — Manual testing (~60–70%)
- **Keyboard only** (unplug the mouse): Tab/Shift+Tab through everything — all interactive elements reachable & operable, **logical focus order**, **no traps** (Esc closes modals, focus returns), a **visible** focus indicator that isn't obscured.
- **Structure**: one `h1`, no skipped heading levels, landmarks (`main`/`nav`/`header`/`footer`), a skip link.
- **Forms**: every field has a programmatic label; errors are identified in text (not color alone) with recovery guidance.
- **Contrast judgment**: text over images/gradients, hover/focus/disabled states (tools miss these).
- **Reflow/zoom**: viewport 1280px → zoom 400% (≈320 CSS px) — no horizontal scroll or clipped content; 200% text resize.
- **Motion**: nothing flashes > 3×/sec; animations respect `prefers-reduced-motion`; auto-playing motion can be paused.
- **Alt/link quality**: is the text *meaningful*, not just present?

## Layer 3 — Assistive-technology testing
Verify with a real screen reader — **NVDA** (free, Windows), **VoiceOver** (macOS/iOS), or **JAWS**: correct names/roles/states announced, reading order matches visual order, form errors and live regions announced, custom widgets behave per the ARIA APG.

## Cadence
- **CI**: axe-core/Pa11y/Lighthouse CI on every PR to catch regressions.
- **Quarterly**: manual spot-checks of high-traffic pages and key flows.
- **Annually**: full manual + AT audit.

## Reporting
Map each finding to its **success criterion** (e.g. "1.4.3 Contrast, AA"), severity, the element, and a fix. Separate **confirmed violations**, **needs-review** (axe "incomplete" + contrast/reflow judgment), and **manual-only** (AT/human-judgment) so nothing is silently passed.
