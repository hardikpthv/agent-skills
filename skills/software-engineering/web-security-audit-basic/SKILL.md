---
name: web-security-audit-basic
description: Use when auditing or reviewing a website or web app for security vulnerabilities against industry standards — OWASP Top 10 (2025), OWASP ASVS, security headers (CSP, HSTS), TLS/HTTPS, cookie flags, CORS, dependency/CVE scanning, secrets exposure, auth/session/access-control review, or injection risks. For DEFENSIVE auditing of your OWN or explicitly authorized sites only. Use whenever someone asks for a "security audit / review," "vulnerability check," "OWASP audit," "security headers check," "is my site secure," or "find security issues."
---

# Web Security Audit (Basic)

## Overview

Run a credible, **defensive** security review of a website against industry standards. This skill is the **map and the SOP**: the standards to measure against, the layered checks, and the non-destructive way to do them. It uses **OWASP Top 10:2025** for awareness/triage, **OWASP ASVS** as the concrete checklist, **OWASP WSTG** for test procedures, and **CVSS 4.0** for severity.

**Core principle: authorization first, passive by default, never destructive.** Standards also move — the Top 10 updated to **2025** (SSRF folded into A01; new A03 Software Supply Chain Failures; new A10 Mishandling of Exceptional Conditions); ASVS is **5.0**. Re-verify against [references/official-links.md](references/official-links.md).

This is the **Basic** tier: you *guide a human* through a structured, non-destructive review. For a hands-on automated audit — header/TLS checks, dependency & secret scanners, passive DAST, and an OWASP/ASVS-referenced report — use `web-security-audit-pro`.

## Authorization first (read before touching anything)

1. **Only assets the user owns or is explicitly, verifiably authorized to test.** No third-party or shared infrastructure without written permission.
2. **Define scope** (hosts, URLs, repos), testing windows, and rate limits before any request.
3. **Passive / read-only by default.** Header, TLS, cookie, and dependency checks are safe. **Active scanning, injection probing, brute force, and any exploitation require separate explicit consent** — and even then, **no destructive payloads, no DoS, no data exfiltration.**
4. Exploitation-dependent findings are **reported for manual review**, not auto-exploited.

## When to use

- "Run a security audit / vulnerability check on my site"
- Checking security headers, TLS, cookies, CORS, CSP
- Dependency/CVE scanning, secret exposure, auth/session/access-control review
- Mapping findings to OWASP Top 10 / ASVS

**Not for:** testing systems you don't own or aren't authorized to test, offensive/red-team exploitation, or building attack tooling. This is defensive auditing only.

## Learn this first: the standards

- **OWASP Top 10:2025** — awareness/triage categories (A01 Broken Access Control [incl. SSRF], A02 Security Misconfiguration, A03 Software Supply Chain Failures, A04 Cryptographic Failures, A05 Injection, A06 Insecure Design, A07 Authentication Failures, A08 Software/Data Integrity Failures, A09 Logging & Alerting Failures, A10 Mishandling of Exceptional Conditions).
- **OWASP ASVS 5.0** — the pass/fail checklist. **L1** = baseline for every app; **L2** = default for apps handling sensitive data; **L3** = high-value systems.
- **OWASP WSTG v4.2** — how to actually test each area.
- **CVSS 4.0** — score/rank severity in the report.

Detail: [references/owasp-checklist.md](references/owasp-checklist.md).

## The audit layers (passive → light-active)

See [references/audit-methodology.md](references/audit-methodology.md).

1. **Dependency / SCA** — manifests vs known CVEs (`npm audit`, Dependency-Check, Trivy).
2. **Security headers** — CSP, HSTS, X-Frame-Options/frame-ancestors, X-Content-Type-Options, Referrer-Policy, Permissions-Policy.
3. **TLS/HTTPS** — TLS 1.2+ (prefer 1.3), valid cert, HTTP→HTTPS redirect, no mixed content.
4. **Cookies** — Secure, HttpOnly, SameSite.
5. **CORS / CSP correctness** — no `*` origin with credentials.
6. **Secrets exposure** — `.git/`, `.env`, backups, source maps, keys in client bundles or repo history.
7. **Auth / session / access control** — password policy, MFA, session handling, IDOR/broken access (ASVS + manual).
8. **Input/injection** — identify points; non-destructive verification only.
9. **Logging & error handling** — no verbose stack traces / version banners; failures don't fail open.

## Key checks (quick reference)

| Area | Want |
|------|------|
| HSTS | `Strict-Transport-Security: max-age=…; includeSubDomains` |
| CSP | present, no `unsafe-inline`/`unsafe-eval` where avoidable |
| Clickjacking | `frame-ancestors` (or X-Frame-Options) |
| MIME | `X-Content-Type-Options: nosniff` |
| Cookies | `Secure; HttpOnly; SameSite=Lax/Strict` |
| TLS | 1.2+/1.3, valid cert, redirect to HTTPS |
| CORS | no wildcard origin with credentials |
| Deps | no known-CVE packages (map to CVSS 4.0) |

## Common findings

Missing/weak security headers (esp. CSP), missing HSTS, outdated dependencies with CVEs, exposed secrets/`.env`/`.git`, insecure cookies, CORS wildcard with credentials, verbose errors/version disclosure, missing rate limiting, mixed content, and broken access control (consistently #1).

## Common mistakes

- **Testing without authorization/scope** — the cardinal sin. Always confirm first.
- **Running active/destructive scans by default** — passive first; active only with consent.
- **Treating a header grade as a full audit** — access control & logic need manual review.
- **Auto-exploiting to "confirm"** — report for manual review instead.
- **Ignoring dependencies & secrets** — the most common real-world breaches.
