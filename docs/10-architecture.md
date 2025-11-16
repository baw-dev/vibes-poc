# Vibes E2E POC — Architecture

## Context
- Goal: Minimal-effort pipeline from user story to deployment across Integration/UAT/Prod demo using free/trial tooling.
- Constraints: GitHub Actions, SFDX auth URLs, Dev Hub trial quotas.

## Diagram
Dev (VS Code + optional Agentforce Vibes) → GitHub (vibes-poc) → GitHub Actions → Package (service-cases) → Integration (integ) → UAT (uat) → Prod demo (proddemo)

## Source Strategy
- Repo: vibes-poc (mono-repo)
- Package: service-cases (unlocked; path: force-app)
- Branching: main default; feature branches feat/*; Conventional Commits

## CI/CD Strategy
- PR to main: scratch build → format/lint → LWC Jest → Code Analyzer → Apex tests
- Merge/push to main: package version create → deploy to integ → approval → deploy to uat → optional proddemo
- Coverage gate: Apex ≥75% (target 85%)

## Security & Access
- Auth: SFDX auth URLs for integ/uat/proddemo stored in GitHub Secrets
- Dev Hub auth local for version create (runner will use web/url auth in POC)

## Observability
- GitHub Actions logs, test output, coverage summaries
- CHANGELOG.md for release notes and package install IDs

## Trade-offs
- Unlocked packages enable repeatable installs but require coverage during version creation
- SFDX auth URLs are quick for POC; JWT preferred later
