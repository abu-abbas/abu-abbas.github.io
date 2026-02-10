# Project Rules And Decisions

## Stack
- Vue 3 + TypeScript + Vite.
- Tailwind via build pipeline (`postcss` + `tailwind.config.js`), not CDN.
- `html2pdf.js` still loaded from CDN for PDF generation.

## Data Structure
- CV content is stored in `src/data/cvData.json`.
- Typed access is defined in `src/data/cvData.ts`.
- `App.vue` consumes data from `cvData.ts` (not hardcoded inline objects).

## PDF Export Behavior
- Export is forced to light mode.
- Print is also forced to light mode, then restored to previous theme.
- PDF export uses a clone strategy in `downloadPDF()` with explicit width/height constraints.
- Interests text uses a fallback in clone to avoid last-section rendering loss.
- Current export is tuned for smaller file size (JPEG + compression).

## Lint And Format
- ESLint + Prettier are configured.
- Commands:
  - `yarn lint`
  - `yarn lint:fix`
  - `yarn format`
  - `yarn format:check`

## GitHub Pages Strategy
- Repo target: `abu-abbas.github.io`.
- `vite.config.ts` handles base path for user page (`/`) and project pages (`/<repo>/`) in Actions context.
- GitHub Actions workflow exists at:
  - `.github/workflows/deploy-pages.yml`
- Actions deploy trigger branch: `source`.
- If Actions is blocked, manual deploy path is used.

## Manual Deploy Flow
- Source code branch: `source`.
- Static publish branch: `main`.
- Manual deploy script:
  - `scripts/deploy-manual.sh`
- Command:
  - `yarn deploy:manual`
- Detailed guide:
  - `DEPLOY.md`

## Versioning
- Semantic versioning is enabled in `package.json`.
- Release commands:
  - `yarn release:patch`
  - `yarn release:minor`
  - `yarn release:major`

## Ignore Rules
- Current ignore baseline is in `.gitignore`.
- Includes: `node_modules`, `dist`, `.output-pdf`, logs, local env, editor/system artifacts.
