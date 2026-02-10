# CV Online

Personal CV website built with Vue 3 + TypeScript + Vite.

## Tech Stack

- Vue 3
- TypeScript
- Vite
- Tailwind CSS (build-time via PostCSS)
- html2pdf.js + jsPDF for PDF export

## Local Development

```bash
yarn install
yarn dev
```

## Quality Checks

```bash
yarn lint
yarn format:check
```

## Release Flow

Run from `source` branch with clean working tree.

```bash
yarn release:patch
# or
yarn release:minor
yarn release:major
```

This will:

- bump semantic version (`npm version`)
- create commit + git tag
- push branch and tags (`git push --follow-tags`)

## Manual Deploy (GitHub Pages)

This project uses:

- `source` branch for source code
- `main` branch for static deploy output

Deploy command (run from `source`):

```bash
yarn deploy:manual
```

For details, see `DEPLOY.md`.

## Project Notes

Project decisions and conventions are tracked in `rules.md`.
