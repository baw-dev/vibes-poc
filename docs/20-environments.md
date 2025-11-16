# Vibes E2E POC — Environments

## Matrix
- Dev Hub (devhub): creates scratch orgs and package versions
- Scratch Orgs: alias pattern so-$(date +%s), lifespan up to 7 days
- Integration (integ): DE org for automated installs and smoke tests
- UAT (uat): DE org with manual approval gate
- Prod demo (proddemo): optional DE org for demos

## Config Per Environment
- Feature flags: none for POC
- Custom Metadata: none for POC
- Post-install scripts: none (add later if needed)

## Data Management
- Seed datasets: none required
- Refresh cadence: n/a

## Access & Users
- CI auth: SFDX auth URLs stored as GitHub Secrets (SFDX_AUTH_URL_INTEG, SFDX_AUTH_URL_UAT, SFDX_AUTH_URL_PROD_DEMO)
- Approvals: baw via GitHub protected environment

## Limits & Quotas
- Dev Hub trial scratch quotas; prefer short-lived scratch orgs
