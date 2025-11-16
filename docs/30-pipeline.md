# Vibes E2E POC — Pipeline

## Triggers
- PR to main → scratch build/test/scan
- Merge/push to main → package version → integ deploy → approval → uat deploy → optional proddemo

## Stages & Key Commands
1) Setup
   - Create scratch:
     sf org create scratch -f config/project-scratch-def.json --duration-days 7 --alias so-$GITHUB_RUN_ID
   - Deploy:
     sf project deploy start -o so-$GITHUB_RUN_ID
2) Quality
   - Format/Lint: npm run format && npm run lint
   - LWC tests: npm run test:unit
   - Scanner: sf scanner run --target "force-app/**"
   - Apex tests:
     sf apex run test -o so-$GITHUB_RUN_ID --codecoverage
3) Package
   - Create version:
     sf package version create --codecoverage --path force-app --wait 120 --installationkeybypass
4) Deploy
   - Integration:
     sf package install --package "service-cases@latest" -o integ --wait 30 --noprompt
   - UAT (after approval):
     sf package install --package "service-cases@latest" -o uat --wait 30 --noprompt
   - Prod demo (optional):
     sf package install --package "service-cases@latest" -o proddemo --wait 30 --noprompt
5) Post-Deploy
   - Smoke tests:
     sf apex run test -o integ --tests ".*" --result-format human

## Approvals
- UAT: GitHub protected environment; approver: you

## Rollback
- Install previous package:
  sf package install --package <prev-04t> -o integ --wait 30 --noprompt
  sf package install --package <prev-04t> -o uat --wait 30 --noprompt

## Artifacts
- CI logs, test reports, coverage, scanner output
- CHANGELOG.md entries with version IDs and install commands

## Notes/Fixes
- Use --duration-days (not -d) with sf org create scratch
- For initial pushes to GitHub, use a Personal Access Token (PAT) instead of password
- VS Code Apex Language Server requires Java; install OpenJDK (e.g., brew install openjdk)
