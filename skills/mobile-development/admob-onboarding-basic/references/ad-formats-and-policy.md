# Ad formats & placement (policy-safe)

Pick a format per placement, then place it so it earns without breaking policy (accidental clicks and bad timing are the fastest routes to suspension).

## The formats
| Format | Use for | Placement / UX rule |
|--------|---------|----------------------|
| **Banner** (anchored/adaptive) | steady, low-intrusion revenue | Keep clear of nav/buttons; don't refresh too fast or stack. |
| **Interstitial** (full-screen) | natural breaks (level end, screen change) | **Never** on app launch/exit, mid-task, or during loading; cap frequency. |
| **Rewarded** (opt-in video) | give an in-app reward; best yield + UX | Always opt-in, clearly labeled; grant reward only on completion. |
| **Rewarded interstitial** | rewarded shown at a transition | Must show the **opt-in intro/disclosure** before the ad. |
| **Native (advanced)** | ads styled to match your UI | Must be **labeled "Ad"**; don't disguise as organic content/nav. |
| **App open** | while the app loads/foregrounds | Only on true cold/warm foreground, **not first-ever launch**; respect frequency; don't block real loading. |

## Placement policy essentials
- **No ads on non-content screens** — loading, splash, error, or screens with no real content.
- **No accidental-click bait** — ads not flush against buttons/menus; leave spacing.
- **No unexpected full-screens** interrupting an action.
- **Frequency** — don't bombard; interstitials/app-open need sensible caps.
- **Label native ads** clearly.

## Invalid traffic = suspension
- **Never click your own ads.** Never ask others to. Never test on **live** ads — use **test ad unit IDs** / test devices.
- Don't artificially inflate impressions/clicks. Google's systems flag invalid traffic and can disable ad serving or the account.

## Families / children
If the app is child-directed or mixed-audience, tag **age treatment (TFAT)** correctly and use a Families-certified setup; don't send restricted identifiers for children. See the policy links in [official-links.md](official-links.md).

## Choosing a mix
Most apps: a **banner** on content screens + **rewarded** for optional boosts + a **well-capped interstitial** at natural breaks. Rewarded tends to monetize best with the least user friction.
