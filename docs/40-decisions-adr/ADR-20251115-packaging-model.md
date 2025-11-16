# ADR-20251115-packaging-model

## Status
Accepted

## Context
We need a repeatable, versioned way to deliver metadata for the POC across Integration, UAT, and Prod demo.

## Decision
Use a single unlocked package ("service-cases") in a mono-repo (vibes-poc).

## Alternatives Considered
- Change sets: easy but not versioned or automatable; poor CI/CD fit.
- Multi-package: better modularity; adds complexity not needed for POC.

## Consequences
- Positive: Simplified CI/CD, clear artifact (package version), easy installs.
- Negative: Less modular; future scaling may require package split.
- Follow-ups: Revisit multi-package later.

## Links
- Repo: https://github.com/baw-dev/vibes-poc
- Pipeline: docs/30-pipeline.md
