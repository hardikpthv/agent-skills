# Vendor details

Verified by hand on 25 Nov 2026. Sites change; if a form looks different, describe what you see to the user before submitting.

`<domain>` below means the bare host, e.g. `licence.example.dev`.

## 1. Symantec / Broadcom WebPulse (Blue Coat)

- Site: https://sitereview.bluecoat.com/
- Lookup: https://sitereview.bluecoat.com/#/lookup-result/<domain>
- First visit may show a Cloudflare **"verify you are human"** check. Human only.
- Results seen: **Suspicious** (security risk, RED), "has not yet been rated" (AMBER), or a category.
- To fix:
  1. On the result page click **Other**. Never pick "Risky".
  2. Filtering Service: **Symantec Edge SWG** (the corporate proxy). Type "SWG" to filter the list.
  3. Category: **Technology/Internet**.
  4. Email: the contact address. **Clear the field first**: it keeps the previous value between submissions, and you get the email twice.
  5. Comment: the template from SKILL.md.
  6. **Submit for Review**.
- Confirmation: "Your page submission has been received".
- They email the decision to the contact address.

## 2. Palo Alto Networks (PAN-DB)

- Site: https://urlfiltering.paloaltonetworks.com/
- Lookup on the main page needs a **reCAPTCHA**. Human only.
- Since 15 Mar 2026 a **login is required** for every change request. Free account; the human signs up and logs in.
- Once logged in, the change form is at https://urlfiltering.paloaltonetworks.com/single_cr/?url=<domain> . It shows **Current Risk Level** and **Current Category** with no CAPTCHA, so use it to read status too.
- Category picker: type "computer", pick **Computer-and-Internet-Info**.
- Comment field ("evidence") is required. Use the template.
- Confirmation: "Change request has been successfully submitted."
- Facts:
  - Category **Unknown** is automatically **High-Risk** (RED).
  - **Newly-Registered-Domain** cannot be recategorised; the form marks it "*Category is not supported for recategorization". It drops off by itself about 32 days after registration. Record the expected date, do not submit.

## 3. Fortinet FortiGuard

- Lookup: https://www.fortiguard.com/webfilter needs "I'm not a robot". Human only.
- The request form works **without CAPTCHA**: https://www.fortiguard.com/faq/wfratingsubmit?url=<domain> . If the lookup is stuck on the CAPTCHA, mark the rating "waiting for human" but you can still submit here.
- Fields:
  - URL (prefilled)
  - Suggest a category: **Information Technology**
  - Name: a role name, e.g. "<Company> Support"
  - Email: the contact address
  - Company Name
  - Comment: the template
- Confirmation: a "Thank you" page.
- Usually reviewed within 24 hours; they email.

## 4. McAfee / Trellix

- Site: https://sitelookup.mcafee.com/
- No CAPTCHA, no account.
- Type the URL, click **Check URL**. Shows **Status** (e.g. "Uncategorized URL") and **Trust**.
- To fix:
  - Category 1: **Software/Hardware** (option value `hw`)
  - Category 2: **Computing/Internet** (option value `ci`)
  - Comment: optional; use the template.
  - **Submit URL for Review**.
- No email field: you get no notice. Recheck after 3 to 5 business days.

## 5. Check Point

- https://urlcat.checkpoint.com/urlcat/ redirects to a login (Check Point User Center). Free account; the human signs up, validates the email and logs in.
- After login, read status and request a change on one page, no CAPTCHA: https://usercenter.checkpoint.com/ucapps/urlcat/url-details?q=<domain>
- It shows **Current Categories** (e.g. "Newly Registered Domain, Low Risk" or "Uncategorized"). Unlike Palo Alto, a Newly Registered Domain *can* get a change request here.
- Expand **Request a Category Change**: Category One is a type-to-filter combobox; type "Computers" and pick **Computers / Internet**. Category Two optional. Additional Information (optional, max 1042 characters): the comment.
- Confirmation: **Report Submitted** with a Reference ID. Check Point emails the account's address when it is handled; status also under "Check Request Status".

## 6. Cisco Talos

- https://talosintelligence.com/reputation_center
- Disputes and category requests need a free Cisco account (human).
- Some browser-automation setups are not allowed to open this domain at all. Then it is fully a human step: give the user the lookup URL, ask them to read out the rating and category shown, and give the category and comment to request.

## 7. Zscaler and Netskope

- Zscaler: https://sitereview.zscaler.com/
- Netskope: https://www.netskope.com/url-lookup
- Both are **customer-only** now. Only someone at a company that uses them (or its IT team) can check or request, often straight from the block page.
- Action: ask the person who saw the block for the **exact block-page text** (it names the vendor and category). Give them a short note for their IT team: the domain, what it hosts, and the category to request.

## 8. Google Safe Browsing (check only)

- https://transparencyreport.google.com/safe-browsing/search?url=<domain>
- "No unsafe content found" = fine. Anything else is RED and needs its own investigation; stop and tell the user.
