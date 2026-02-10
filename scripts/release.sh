#!/usr/bin/env bash
set -euo pipefail

RELEASE_TYPE="${1:-}"

if [[ -z "$RELEASE_TYPE" ]]; then
  echo "Usage: bash ./scripts/release.sh <patch|minor|major>"
  exit 1
fi

if [[ "$RELEASE_TYPE" != "patch" && "$RELEASE_TYPE" != "minor" && "$RELEASE_TYPE" != "major" ]]; then
  echo "Error: release type must be one of: patch, minor, major"
  exit 1
fi

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$CURRENT_BRANCH" != "source" ]]; then
  echo "Error: release must be run from 'source' branch. Current: '$CURRENT_BRANCH'."
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Error: working tree is not clean. Commit or stash changes first."
  exit 1
fi

echo "Bumping $RELEASE_TYPE version..."
npm version "$RELEASE_TYPE"

echo "Pushing branch and tags..."
git push --follow-tags origin "$CURRENT_BRANCH"

echo "Release complete."
