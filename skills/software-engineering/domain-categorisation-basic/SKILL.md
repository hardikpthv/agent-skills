---
name: domain-categorisation-basic
description: Use when a domain is blocked or flagged by company web filters (Symantec/Broadcom WebPulse, Palo Alto, Fortinet FortiGuard, McAfee/Trellix, Check Point, Cisco Talos, Zscaler, Netskope) and needs checking and recategorising. Trigger on "check/whitelist/categorise my domain", "our site is blocked at a company", "web filter blocks us", "Zscaler/Palo Alto/Symantec blocks us", "new domain launch", "recheck domain categories", and before or right after any new product domain, licence server or checkout host goes live.
---

# Domain Categorisation (Basic)

## Overview

Corporate web filters rate new domains "Uncategorized", "Newly Registered Domain", "Unknown" or even "Suspicious". People at work then can't open the product site, buy, or reach the licence server or API. This skill gets every domain looked up at every filter vendor that allows it, rates the result RED/AMBER/GREEN, gets fixes submitted, and tracks them until they clear.

This is the **Basic** tier: you *guide the human*. You give them the exact URL, what to pick, and the comment text; they do the lookups and submissions in their own browser and tell you what each page says. For an agent that drives the vendor sites itself, use `domain-categorisation-pro`.

Per-vendor URLs, form fields and quirks: [references/vendors.md](references/vendors.md). Tracking table: [templates/status-table.md](templates/status-table.md).

## Ground rules

- **Every submission is a request in the company's name.** Before the human submits anything, agree the domains, vendors, category per vendor, contact email and comment text.
- **Never invent facts about a site** in a comment. Use only what the human confirmed or what is visible on the live site.
- Use a **role name** ("<Company> Support") and a **role email** in the forms, not a person's.
- **Evidence only:** record what each vendor page says word for word. A failed or empty lookup is "unknown", never GREEN.
- Ratings change. Every table carries the date it was checked.

## Inputs

1. **Domains.** Ask if not given. Include every host users or apps hit, not just the main site:
   - the product site(s) and company site,
   - licence, checkout, API, auth and download hosts (e.g. `licence.example.dev`, `api.example.dev`),
   - the email domain.
2. **Company facts** for the comment: company name, country, what it makes, what each domain hosts.
3. **Contact email**, preferably a role address (e.g. `support@<company domain>`).
4. **Registration date** of each domain (month and year), for the comment and for Newly-Registered timing.

Order the domains by importance: the one that handles **buying, licences or the API first**, then the main product site, then the rest.

## Ratings

| Rating | Meaning |
| --- | --- |
| **RED** | Suspicious, High-Risk, malicious, phishing, or any category companies commonly block. Fix first. |
| **AMBER** | Uncategorized, Unknown, Not Rated, "not yet been rated", Newly Registered Domain. Many filters block these by default. |
| **GREEN** | The right category (e.g. Technology/Internet, Computer-and-Internet-Info, Information Technology) and low risk. |
| **n/a** | Vendor lookup is customer-only or needs an account the human doesn't have yet. Say which. |

Palo Alto: a domain in **Unknown** is automatically **High-Risk**, so treat it as RED.

## Step 1: Look up every domain at every vendor

Give the human the lookup URL per domain from [references/vendors.md](references/vendors.md), in this order (most common in companies first), and fill the status table from what they read back:

1. Symantec / Broadcom WebPulse
2. Palo Alto Networks (free account needed; status shows on the change form)
3. Fortinet FortiGuard
4. McAfee / Trellix (no CAPTCHA, no account; the quickest)
5. Check Point (free account needed)
6. Cisco Talos (free account needed for disputes)
7. Zscaler and Netskope (customer-only; see below)
8. Google Safe Browsing (check only)

**Zscaler and Netskope** lookups are customer-only. Only someone at a company that uses them (or its IT team) can check or request, often from the block page itself. If someone reported a block, ask for the **exact block-page text**: it names the vendor and the category, which tells you where to act.

Show the filled table before Step 2.

## Step 2: Submit requests for every RED and AMBER cell

1. Agree the list (see Ground rules).
2. Most important domain first, most common vendor first: Symantec, Palo Alto, Fortinet, then McAfee, Check Point, Cisco.
3. Category to request (software / internet business):

   | Vendor | Category |
   | --- | --- |
   | Symantec | Technology/Internet (service: Symantec Edge SWG) |
   | Palo Alto | Computer-and-Internet-Info |
   | Fortinet | Information Technology |
   | McAfee | Software/Hardware + Computing/Internet |
   | Check Point | Computers / Internet |
   | Cisco | Its closest "computers / internet / software / technology" category |

   For a business that isn't software, pick the vendor's closest honest category and note why.
4. Skip what can't be changed: Palo Alto **Newly-Registered-Domain** isn't recategorisable. It drops off by itself about 32 days after registration; record that date instead.
5. For each submission, give the human the form URL, the field values and the comment, and ask them to read back the confirmation text (vendors.md lists what each says). No confirmation means not submitted.

**Comment template** (adapt per domain; keep it true and short):

> <Company> (<country>) makes <what>. <domain> is <what it hosts>. No downloads, no ads, no user-generated content. The domain is new (<month year>), which is likely why it was rated <rating>.

Drop "No downloads" if the domain does serve downloads, and so on. Every sentence must be true for that domain.

## Step 3: Report

One table, one row per submission:

| Domain | Vendor | Rated before | Requested | Confirmation | Where the answer arrives | Recheck on |
| --- | --- | --- | --- | --- | --- | --- |

- **Where the answer arrives:** the contact email (Symantec, Fortinet); Check Point emails the account address; Palo Alto: recheck on the change form; McAfee: no notice, recheck.
- **Recheck on:** about 1 week after submitting; McAfee 3 to 5 business days; Palo Alto Newly-Registered about 32 days after registration.

Below the table, list the steps still open (accounts, Cisco/Check Point if not done), who to ask for Zscaler/Netskope, and the Google Safe Browsing result per domain. Fill [templates/status-table.md](templates/status-table.md) and save it where the human keeps such notes.

## Step 4: Recheck later

On the recheck date, repeat Step 1 for every submitted cell. GREEN cells are done; cells still RED/AMBER after two weeks get a second request or an email to the vendor. Check the contact inbox for vendor decisions and record them.

## Common mistakes

- Checking only the main site and forgetting the licence, checkout, API or email hosts.
- Assuming a fix at one vendor carries to another. Each vendor categorises separately.
- Picking "Risky" or a vague category at Symantec. Use **Other** → Symantec Edge SWG → Technology/Internet.
- Submitting the same domain twice to one vendor in one run.
- Leaving the previous address in Symantec's email field, so the email ends up in it twice.
- Waiting on Palo Alto Newly-Registered-Domain instead of noting its drop-off date.
