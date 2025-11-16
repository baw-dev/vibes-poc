# Summary
Briefly describe the change and why it’s needed.

## Scope
- Package: service-cases
- Related story: <link or ID>
- Affected areas: <objects, Apex classes, LWCs, metadata>

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2

## Implementation Notes
- Design doc: stories/<id>/design.md
- Test spec: stories/<id>/test-spec.md
- ADR(s): docs/40-decisions-adr/<ADR-file>.md (if applicable)

## Quality Checks
- [ ] Lint passed (ESLint/Prettier)
- [ ] LWC unit tests passed (Jest)
- [ ] Security scan passed (Salesforce Code Analyzer/PMD)
- [ ] Apex tests passed in scratch org
- [ ] Coverage ≥ 75% (Apex); target 85%
- [ ] LWC coverage ≥ 70% (target)

## Deployment
- Packaging: unlocked (service-cases)
- Post-merge: auto package version → install to integ → approval → install to uat
- Rollback plan: install previous 04t version

## Screenshots / Demo (optional)
<images or links>

## Checklist (Conventional Commits)
- [ ] PR title follows Conventional Commits (e.g., feat: add severity rule on Case)
- [ ] Changelog entry prepared (see below)

## Changelog Entry
- Type (feat|fix|perf|docs|refactor|test|chore): 
- Scope (service-cases): 
- Summary: 
