# Runbook: Release to Integration/UAT (Vibes E2E POC)

## Preconditions
- Main branch CI green
- Latest version "service-cases@latest" created in CI

## Steps
1) Verify version creation in GitHub Actions logs.
2) Integration deploy (auto or manual check):
   sf package install --package "service-cases@latest" -o integ --wait 30 --noprompt
   Smoke:
   sf apex run test -o integ --tests ".*"
3) Request UAT approval (GitHub protected environment):
   Approver: you
4) UAT deploy (post-approval):
   sf package install --package "service-cases@latest" -o uat --wait 30 --noprompt
5) Optional Prod demo:
   sf package install --package "service-cases@latest" -o proddemo --wait 30 --noprompt

## Rollback
- Install previous version (record last 04t in CHANGELOG):
  sf package install --package <prev-04t> -o integ --wait 30 --noprompt
  sf package install --package <prev-04t> -o uat --wait 30 --noprompt

## Contacts
- Owner/Approver: You (Email)
