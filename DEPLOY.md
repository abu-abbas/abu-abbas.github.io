# Manual Deploy (Without GitHub Actions)

This project supports manual deploy for GitHub Pages using two branches:

- `source`: source code branch (Vue + Vite project)
- `main`: deploy branch (static files from `dist`)

## One-time setup

1. Create and push the source branch:

```bash
git checkout -b source
git push -u origin source
```

2. Keep `main` as your GitHub Pages branch (root).

## Deploy command

Run this from the `source` branch only:

```bash
yarn deploy:manual
```

## Semantic versioning

Bump version from `source` branch before deploy:

```bash
yarn release:patch   # 1.0.0 -> 1.0.1
yarn release:minor   # 1.0.0 -> 1.1.0
yarn release:major   # 1.0.0 -> 2.0.0
```

Release command will:

- run `npm version <type>` (create version commit + git tag)
- push current branch and tags with `git push --follow-tags`

What it does:

- Builds with `yarn build`
- Uses a temporary git worktree for `main`
- Replaces `main` contents with build output from `dist`
- Commits and pushes `main`

## Optional

If your source or deploy branch names are different:

```bash
bash ./scripts/deploy-manual.sh <source-branch> <deploy-branch>
```
