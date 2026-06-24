# WCAG 2.2 AA checklist (audit against this)

Target **Level AA** (= all A + AA criteria). Confirm wording in the [Quickref](https://www.w3.org/WAI/WCAG22/quickref/). Grouped by POUR.

## Perceivable
- **1.1.1 Non-text Content (A)** — meaningful images have *meaningful* alt; decorative images have empty `alt=""`.
- **1.2.x Media (A/AA)** — captions for video, audio description / transcript.
- **1.3.1 Info & Relationships (A)** — semantic structure (headings, lists, `<th>`, labels) not just visual.
- **1.3.5 Identify Input Purpose (AA)** — `autocomplete` on common fields.
- **1.4.3 Contrast (Minimum) (AA)** — text **4.5:1** (large text **3:1**).
- **1.4.4 Resize Text (AA)** — usable at 200% text zoom.
- **1.4.10 Reflow (AA)** — no 2-D scroll / loss at **400% zoom (320 CSS px)**.
- **1.4.11 Non-text Contrast (AA)** — UI components & graphics **3:1**.
- **1.4.12 Text Spacing (AA)** — no loss when spacing is increased.

## Operable
- **2.1.1 Keyboard (A)** / **2.1.2 No Keyboard Trap (A)** — everything operable by keyboard; focus never stuck.
- **2.4.1 Bypass Blocks (A)** — skip link / landmarks.
- **2.4.3 Focus Order (A)** — logical tab order.
- **2.4.4 Link Purpose (A)** — link text makes sense (no bare "click here").
- **2.4.6 Headings & Labels (AA)** — descriptive; correct `h1→h2→h3` order.
- **2.4.7 Focus Visible (AA)** — a visible focus indicator.
- **2.4.11 Focus Not Obscured (Minimum) (AA, new in 2.2)** — focused element not hidden behind sticky UI.
- **2.5.7 Dragging Movements (AA, 2.2)** — pointer alternative to drag.
- **2.5.8 Target Size (Minimum) (AA, 2.2)** — targets **24×24 CSS px** or adequate spacing.
- **2.2.x / 2.3.1** — adjustable time limits; no flash > 3×/sec; honor `prefers-reduced-motion` (2.2.2 pause/stop/hide).

## Understandable
- **3.1.1 Language of Page (A)** — `<html lang>` set.
- **3.2.6 Consistent Help (A, 2.2)** — help in the same relative place.
- **3.3.1 Error Identification (A)** / **3.3.2 Labels or Instructions (A)** / **3.3.3 Error Suggestion (AA)** — clear labels, errors, recovery.
- **3.3.7 Redundant Entry (A, 2.2)** — don't re-ask the same info in a session.
- **3.3.8 Accessible Authentication (Minimum) (AA, 2.2)** — no cognitive-function test to log in (allow paste/password managers).

## Robust
- **4.1.2 Name, Role, Value (A)** — custom controls expose correct name/role/state to AT.
- **4.1.3 Status Messages (AA)** — status updates announced via live regions.
- _Note: **4.1.1 Parsing was removed** in 2.2 — do not flag it._

## Levels at a glance
- **A** = minimum (insufficient alone) · **AA** = the target · **AAA** = aspirational, per-case only.
