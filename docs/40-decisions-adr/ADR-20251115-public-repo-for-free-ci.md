# ADR-20251115-public-repo-for-free-ci

## Status
Accepted

## Context
We need reliable, cost-free continuous integration for the POC (lint, test, packaging) without hitting usage caps or adding paid services.

## Decision
Host the POC in a public GitHub repository to leverage unlimited/free CI minutes on GitHub-hosted runners for public projects.

## Alternatives Considered
- Private repo with GitHub Actions: limited free minutes; risk of throttling or added cost.
- Third-party CI (e.g., CircleCI/Travis) free tiers: stricter limits; integration overhead.
- Self-hosted runners: no minute caps but adds setup/maintenance burden not justified for a short-lived POC.

## Consequences
- Positive: Maximizes free CI minutes; simpler setup; community-visible build logs; faster iteration.
- Negative: Code is public; must avoid storing secrets in repo; security through process not obscurity.
- Follow-ups: Add CODEOWNERS and branch protections; ensure secrets use GitHub Environments and OIDC.

## Links
- Repo: https://github.com/baw-dev/vibes-poc
- Pipeline: docs/30-pipeline.md
- GitHub Actions policy: https://docs.github.com/actions/learn-github-actions/usage-limits-billing-and-administration