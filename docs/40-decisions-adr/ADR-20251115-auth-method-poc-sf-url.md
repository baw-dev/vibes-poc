## ADR-20251115-auth-method-poc-sf-url

## Status
Accepted

## Context
The POC needs quick, low-friction Salesforce org authentication for local dev and CI to install/uninstall packages and run tests.

## Decision
Use Salesforce CLI (sf) auth URLs (sf org display with SfdxAuthUrl; sf org login device/web; sf org login sfdx-url) for the POC to authenticate scratch/non-scratch orgs. Defer JWT-based headless auth until later.

## Alternatives Considered
- JWT-based auth (server-to-server): secure and scalable; requires connected app, key management, and CI secrets setup—overhead for POC timeline.
- Username/password + security token: simple but discouraged; brittle and less secure; often blocked by MFA policies.
- OAuth device/login flows each run: interactive; not CI-friendly.

## Consequences
- Positive: Fast setup; works locally and in CI via stored auth URL secrets; minimal org/config prerequisites.
- Negative: Rotates when session revokes; manual renewal required; less ideal for long-term, headless pipelines.
- Follow-ups: Revisit JWT for durable CI after POC; define process to refresh auth URLs securely.

## Links
- sf CLI auth docs: https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth.htm
- Pipeline: docs/30-pipeline.md
- Example usage:
  - Generate:
    - Web login: sf org login web --alias poc --instance-url https://login.salesforce.com --set-default
    - Or device login (non-browser/CI bootstrap): sf org login device --alias poc --instance-url https://login.salesforce.com --set-default
    - Extract URL: sf org display --target-org poc --json | jq -r '.result.sfdxAuthUrl'
  - Store in CI secret: SF_AUTH_URL
  - CI login step: echo "$SF_AUTH_URL" | sf org login sfdx-url --set-default --alias poc