# Vibes E2E POC

This proof of concept establishes an end‑to‑end, low‑touch pipeline that converts a natural‑language user story into deployable Salesforce changes across multiple orgs. It uses a single unlocked package, GitHub Actions CI/CD, and free/trial Salesforce resources. Agentforce Vibes can automate planning, implementation, and test generation.

### Architecture Overview
- **Source Control:** GitHub (SFDX mono‑repo with one unlocked package: “service-cases”).
- **Orgs:** Dev Hub (scratch orgs), Integration DE, UAT DE, optional Prod demo DE.
- **Packaging:** Unlocked package for all metadata changes.
- **CI/CD:** GitHub Actions for scratch org validation, package version creation, and installs to Integration and UAT (with approvals).
- **Automation Inputs/Outputs (optional Vibes):**
  - Input: User story
  - Outputs: design.md, change-list.json, test-spec.md, implemented metadata, Apex/LWC tests

### Delivery Flow
1. Feature branch created; scratch org auto‑provisioned.
2. Implement metadata and components in force‑app; add tests and static analysis.
3. PR runs CI: lint, Jest, Apex tests, code scanning in a scratch org.
4. Merge to main triggers package version creation and install to Integration.
5. Protected approval gates deploy to UAT; optional job deploys to a Prod demo org.

### Governance & Quality
- **Static Analysis:** Prettier, ESLint (LWC), Code Analyzer.
- **Testing:** LWC Jest; Apex tests with coverage; CI enforces RunLocalTests.
- **Approvals:** GitHub environment protection for UAT.
- **Org Access:** SFDX auth URLs stored as GitHub Secrets for Dev Hub and target orgs.

### Demonstrated Story (Example)
- Case Severity (Low/Medium/High) with validation requiring Reason for High.
- LWC quick action to set Severity and Reason.
- Delivered via unlocked package to Integration and UAT through CI.

### Key Advantages
- **Repeatability:** Scratch‑org‑based validation mirrors production packaging behavior.
- **Security & Separation:** Installs into Integration/UAT via package versions, not metadata API deploys.
- **Scalability:** Single‑package POC with a clear path to multi‑package modularization.
- **Optional AI Assist:** Agentforce Vibes can generate plans, deltas, and tests from stories to accelerate delivery while staying within SFDX boundaries.

### What You Need to Run It
- Dev Hub trial for scratch orgs; two DE orgs (Integration, UAT).
- VS Code with Salesforce CLI/Extension Pack.
- GitHub Free with Actions enabled and SFDX auth URLs as secrets.