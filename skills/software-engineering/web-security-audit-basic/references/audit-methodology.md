# Audit methodology (defensive, authorized, non-destructive)

Mirrors NIST SP 800-115 (Planning → Information Gathering → Vulnerability Analysis → [authorized] Exploitation). For a defensive audit, **stop before exploitation by default.**

## Step 0 — Authorization & scope (non-negotiable)
- Confirm ownership or **written authorization**. Define in-scope hosts/URLs/repos; exclude third-party/shared infra.
- Agree testing windows + rate limits. Default **passive/read-only**.
- Active scanning, injection probing, brute force → **separate explicit consent**, and still no destructive payloads, DoS, or data exfiltration.

## Layers (passive first)
1. **SCA / dependencies** — `npm audit`, OWASP Dependency-Check, Trivy, Dependabot. (Passive.)
2. **SAST** — Semgrep, CodeQL on source. (Passive.)
3. **Secrets** — gitleaks / trufflehog over the repo + history; check exposed `.env`, `.git/`, backups, source maps. (Passive.)
4. **Headers** — Mozilla Observatory / securityheaders.com / direct HEAD requests. (Passive.)
5. **TLS** — SSL Labs / testssl.sh: protocols, ciphers, cert validity, redirect. (Passive.)
6. **Cookies & CORS** — inspect Set-Cookie flags and CORS responses. (Passive.)
7. **Auth / session / access control** — ASVS-driven review + manual IDOR/role checks. (Manual; non-destructive.)
8. **Passive DAST** — ZAP **passive** scan/spider observes traffic only. (Safe.)
9. **Active DAST** — ZAP active scan, Nikto, injection probes. (**Consent required.**)

## Tools: passive vs active
- **Passive/safe by default:** SCA, SAST, secret scanners, header/TLS checkers, ZAP passive.
- **Active (consent required):** ZAP active scan, Nikto, any injection/brute-force probing.

## What stays manual
Business-logic flaws, access-control/IDOR chains across roles, multi-step auth bypass, and anything needing exploitation to confirm are **reported as "needs manual review"** — the audit does not attempt them.

## Reporting
Map each finding to **OWASP Top 10:2025** + the relevant **ASVS** requirement, score with **CVSS 4.0**, give remediation, and rank by severity. Separate **confirmed** from **needs-manual-review**.
