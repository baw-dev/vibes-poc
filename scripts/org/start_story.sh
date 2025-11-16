#!/usr/bin/env bash
set -euo pipefail
BRANCH=${1:-"feat/$(date +%Y%m%d-%H%M%S)"}
echo "Creating branch $BRANCH"
git checkout -b "$BRANCH"
ALIAS="so-$(date +%s)"
sf org create scratch -f config/project-scratch-def.json --duration-days 7 --alias "$ALIAS"
sf project deploy start -o "$ALIAS"
sf org open -o "$ALIAS"
echo "Scratch org alias: $ALIAS"