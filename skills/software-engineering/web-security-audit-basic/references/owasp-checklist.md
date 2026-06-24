# OWASP checklist (Top 10:2025 + ASVS)

Use **Top 10:2025** to triage and **ASVS 5.0** (L1 for all apps, L2 for sensitive-data apps) as pass/fail. Score severity with **CVSS 4.0**. Re-verify against [official-links.md](official-links.md).

## OWASP Top 10:2025 — what to check per category
- **A01 Broken Access Control** *(now includes SSRF)* — enforce authorization server-side; deny by default; check **IDOR** (object refs you can change), missing function-level checks, SSRF via user-supplied URLs. *Consistently #1.*
- **A02 Security Misconfiguration** — security headers, default creds, directory listing, debug endpoints, verbose errors, unneeded features.
- **A03 Software Supply Chain Failures** — outdated/CVE dependencies, unverified build/CI artifacts, compromised packages. Run SCA.
- **A04 Cryptographic Failures** — HTTPS everywhere, TLS 1.2+/1.3, strong hashing (bcrypt/argon2), no secrets in code, no weak ciphers.
- **A05 Injection** — parameterized queries, output encoding (XSS), avoid command/template injection. Identify points; verify non-destructively.
- **A06 Insecure Design** — threat-model gaps; missing rate limiting; abuse cases. Mostly manual.
- **A07 Authentication Failures** — password policy, MFA, secure session IDs, logout invalidation, no credential stuffing exposure.
- **A08 Software/Data Integrity Failures** — verify update/CI integrity (signatures), no insecure deserialization, SRI for third-party scripts.
- **A09 Logging & Alerting Failures** — security events logged, no sensitive data in logs, alerting exists.
- **A10 Mishandling of Exceptional Conditions** *(new)* — errors don't fail open; consistent error handling; no logic bypass on exception.

## ASVS levels
- **L1** — baseline, largely black-box testable. The floor for any app.
- **L2** — default for apps with sensitive/confidential data (most business apps). Needs source/design access.
- **L3** — high-assurance (finance/health/gov).

## Concrete header / transport / cookie targets
| Control | Target |
|---|---|
| `Strict-Transport-Security` | `max-age=31536000; includeSubDomains` (consider `preload`) |
| `Content-Security-Policy` | present; avoid `unsafe-inline`/`unsafe-eval` |
| Clickjacking | CSP `frame-ancestors` (or `X-Frame-Options: DENY/SAMEORIGIN`) |
| `X-Content-Type-Options` | `nosniff` |
| `Referrer-Policy` | `strict-origin-when-cross-origin` or tighter |
| `Permissions-Policy` | restrict unused features |
| Cookies | `Secure; HttpOnly; SameSite=Lax`/`Strict` |
| TLS | 1.2+/1.3, valid cert, HTTP→HTTPS redirect, no mixed content |
| CORS | no `Access-Control-Allow-Origin: *` with `Allow-Credentials: true` |
