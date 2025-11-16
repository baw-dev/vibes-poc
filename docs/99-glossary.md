# Glossary — Vibes E2E POC

- Agentforce Vibes: AI-assisted dev tool used locally to plan/implement changes.
- Unlocked Package: Second-generation package used to deliver metadata.
- service-cases: Single unlocked package for this POC (path: force-app).
- Dev Hub (devhub): Org used to create scratch orgs and package versions.
- Scratch Org: Temporary org per change; alias pattern so-$(date +%s).
- Integration (integ): DE org for automated installs and smoke tests.
- UAT (uat): DE org for approval-gated validation.
- Prod demo (proddemo): Optional DE org to showcase installs.
- SFDX Auth URL: Auth method stored in GitHub Secrets for CI.
- Quality Gate: Lint, Jest, Code Analyzer, Apex tests with ≥75% coverage.
- Conventional Commits: PR/title convention for clear changelog entries.
