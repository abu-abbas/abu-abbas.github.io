import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';

const getBasePath = () => {
  // For project pages: /<repo>/, for user/org pages: /
  if (process.env.GITHUB_ACTIONS === 'true') {
    const repo = process.env.GITHUB_REPOSITORY?.split('/')[1] ?? '';
    if (repo && repo !== 'abu-abbas.github.io') {
      return `/${repo}/`;
    }
  }

  return '/';
};

export default defineConfig({
  base: getBasePath(),
  plugins: [vue()],
});
