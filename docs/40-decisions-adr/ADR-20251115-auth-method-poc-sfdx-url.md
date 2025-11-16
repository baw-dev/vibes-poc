# ADR-20251115-auth-method-poc-sfdx-url

## Status
Accepted

## Context
The POC needs quick, low-friction Salesforce org authentication for local dev and CI to install/uninstall packages and run tests.

## Decision
Use SFDX auth URLs (sfdx auth:url:store) for the POC to authenticate scratch/non-scratch orgs. Defer JWT-based headless auth until later.

## Alternatives Considered
- JWT-based auth (server-to-server): secure and scalable; requires connected app, key management, and CI secrets setup—overhead for POC timeline.
- Username/password + security token: simple but discouraged; brittle and less secure; often blocked by MFA policies.
- OAuth device/login flows each run: interactive; not CI-friendly.

## Consequences
- Positive: Fast setup; works locally and in CI via stored auth URL secrets; minimal org/config prerequisites.
- Negative: Rotates when session revokes; manual renewal required; less ideal for long-term, headless pipelines.
- Follow-ups: Revisit JWT for durable CI after POC; define process to refresh auth URLs securely.

## Links
- SFDX auth URL docs: https://developer.salesforce.com/docs/platform/sfdx_cli_guide/bi_cli_auth_sfdx_connect
- Pipeline: docs/30-pipeline.md
- Example usage:
  - Generate: sfdx auth:web:login --setalias poc --instanceurl https://login.salesforce.com --setdefaultusername; sfdx force:org:display -u poc --json | jq -r '.result.sfdxAuthUrl'
  - Store in CI secret: SFDX_AUTH_URL
  - CI login step: echo "$SFDX_AUTH_URL" | sfdx auth:sfdxurl:store -s -a poc