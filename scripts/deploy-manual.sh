#!/usr/bin/env bash
set -euo pipefail

SOURCE_BRANCH="${1:-source}"
DEPLOY_BRANCH="${2:-main}"

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"

if [[ "$CURRENT_BRANCH" != "$SOURCE_BRANCH" ]]; then
  echo "Error: run this script from '$SOURCE_BRANCH' branch. Current: '$CURRENT_BRANCH'."
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Error: working tree is not clean. Commit or stash changes first."
  exit 1
fi

echo "Building project..."
yarn build

WORKTREE_DIR="$(mktemp -d)"
cleanup() {
  git worktree remove "$WORKTREE_DIR" --force >/dev/null 2>&1 || true
}
trap cleanup EXIT

echo "Preparing deploy worktree for branch '$DEPLOY_BRANCH'..."
git fetch origin "$DEPLOY_BRANCH" >/dev/null 2>&1 || true

git show-ref --verify --quiet "refs/heads/$DEPLOY_BRANCH" \
  && git worktree add "$WORKTREE_DIR" "$DEPLOY_BRANCH" \
  || git worktree add "$WORKTREE_DIR" -b "$DEPLOY_BRANCH"

find "$WORKTREE_DIR" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
cp -R dist/. "$WORKTREE_DIR/"
touch "$WORKTREE_DIR/.nojekyll"

pushd "$WORKTREE_DIR" >/dev/null
git add -A

if git diff --cached --quiet; then
  echo "No changes to deploy."
  popd >/dev/null
  exit 0
fi

git commit -m "Deploy static site: $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
git push -u origin "$DEPLOY_BRANCH"
popd >/dev/null

echo "Deploy complete."
