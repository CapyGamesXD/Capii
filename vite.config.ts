// vite.config.js / vite.config.ts
import { sveltekit } from '@sveltejs/kit/vite';
import { SvelteKitPWA } from '@vite-pwa/sveltekit';

// vite.config.js or vite.config.ts
/** @type {import('vite').UserConfig} */
const config = {
	plugins: [
		sveltekit(),
		SvelteKitPWA({
			strategies: 'generateSW'
		})
	]
};

export default config;
