# Vibes E2E POC — Roadmap

## Objectives (30–60 days)
- [ ] Fully automated pipeline from user story → Integration → UAT
- [ ] Agent-assisted implementation via Agentforce Vibes (where available)
- [ ] Unlocked package ("service-cases") as delivery unit
- [ ] Multi-org installs (Integration, UAT, Prod demo)

## Success Metrics
- CI pass rate ≥ 95% on PRs (lint, unit, scan, Apex tests)
- Package version creation success on first attempt ≥ 90%
- Mean lead time: story start → Integration deploy ≤ 2 days
- UAT approval cycle time ≤ 1 day
- Apex code coverage during package create ≥ 85% (target; min 75%)
- LWC unit test coverage ≥ 70% lines/branches
- MTTR for failed pipeline ≤ 2 hours
- Rollback time to previous package ≤ 30 minutes

## Milestones
1. M1 — Repo + tooling ready (Owner: You, Target: 2025-11-15) ✅
2. M2 — First package version and Integration deploy (Target: YYYY-MM-DD)
3. M3 — UAT approval gate and deploy (Target: YYYY-MM-DD)
4. M4 — Prod demo deploy (Target: YYYY-MM-DD)

## Scope
- In: Single unlocked package (service-cases), GitHub Actions CI/CD, SFDX auth URLs, Integration/UAT/Prod demo installs
- Out:
  - Multi-package architecture and cross-package dependencies
  - Production org change management (CAB, release windows)
  - Data migration/ETL and external integrations
  - Advanced security hardening (profiles overhaul, Shield, CSP)
  - Complex Experience Cloud setup and custom domains
  - Non-free tooling (paid CI minutes, key management)
  - Performance/load testing and large test data volumes
  - Org-wide refactoring or managed package development

## Risks & Mitigations
- Dev Hub trial limits/scratch quotas → Keep scratch lifespan short; recycle often
- Auth instability for SFDX URLs → Rotate secrets; document regeneration steps
- Low Apex coverage at version-create → Add baseline tests; enforce ≥75% gate
- Local tooling issues (e.g., Java for Apex LS) → Install OpenJDK and pin versions

## Daily Log

### 2025-11-15
- Goals:
  - Set up accounts and orgs; initialize project and package
  - Authenticate Dev Hub; add scratch helper; prep Vibes prompts
- Actions:
  - Installed tools: VS Code 1.106.0 (arm64, commit ac4cbdf…), Node.js v25.2.0, Git 2.39.5, Salesforce CLI @salesforce/cli/2.112.6 (node v22.21.0)
  - GitHub: https://github.com/baw-dev (public repo for free CI minutes)
  - Salesforce orgs:
    - Dev Hub trial enabled (Dev Hub + Packaging)
      - https://orgfarm-6a7145e30d-dev-ed.develop.my.salesforce.com/
    - DE orgs:
      - Integration (alias: integ): https://orgfarm-00449552b8-dev-ed.develop.my.salesforce.com/
      - UAT (alias: uat): https://orgfarm-5af5aec64f-dev-ed.develop.my.salesforce.com/
      - Optional Prod demo (alias: proddemo): created/planned
  - VS Code extensions installed: Salesforce Extension Pack, Prettier, ESLint, Apex PMD
  - Repo initialized: vibes-poc
    - Commands:
      - sf project generate -n vibes-poc
      - git init; initial commit "chore: bootstrap SFDX project"
      - main branch + remote: https://github.com/baw-dev/vibes-poc.git
  - Package scaffold: service-cases (unlocked)
    - Commit: "chore: create unlocked package service-cases"
    - Package Id: 0HogL0000000gYjSAI (record will bind in Dev Hub on first version create)
  - Scratch org definition kept minimal (Apex enabled; Lightning)
  - Helper script scripts/org/start_story.sh added and made executable
  - Installed OpenJDK for Apex Language Server (brew install openjdk; openjdk 25.0.1)
  - Added .vibes/ prompt presets
- Decisions:
  - Use public repo to maximize free CI minutes (ADR planned)
  - Stick with SFDX auth URLs for POC simplicity
- Issues/Blocks:
  - GitHub push error (no PAT) → Resolved by creating a PAT (classic) with repo scope
  - CLI argument fix: use --duration-days instead of -d for sf org create scratch
  - VS Code Apex Language Server required Java → Installed OpenJDK
- Next steps:
  - Add GitHub Actions workflow for PR checks and packaging
  - Generate SFDX auth URLs for integ/uat/proddemo and store in GitHub Secrets
- Links:
  - Repo: https://github.com/baw-dev/vibes-poc
