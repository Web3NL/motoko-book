import { NodeModulesPolyfillPlugin } from '@esbuild-plugins/node-modules-polyfill';
import inject from '@rollup/plugin-inject';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vitest/config';

export default defineConfig({
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}']
	},
	build: {
		rollupOptions: {
			plugins: [
				inject({
					modules: { Buffer: ['buffer', 'Buffer'] }
				})
			]
		}
	},
	// Node polyfill agent-js. Thanks solution shared by chovyfu on the Discord channel.
	// https://stackoverflow.com/questions/71744659/how-do-i-deploy-a-sveltekit-app-to-a-dfinity-container
	optimizeDeps: {
		esbuildOptions: {
			// Node.js global to browser globalThis
			define: {
				global: 'globalThis'
			},
			// Enable esbuild polyfill plugins
			plugins: [
				// @ts-ignore
				NodeModulesPolyfillPlugin(),
				{
					name: 'fix-node-globals-polyfill',
					setup(build) {
						build.onResolve({ filter: /_virtual-process-polyfill_\.js/ }, ({ path }) => ({ path }));
					}
				}
			]
		}
	},
	server: {
		proxy: {
			'/api': 'http://localhost:8080'
		}
	},
	define: {
		'process.env': {
			"VITE_BACKEND_CANISTER_ID": "bkyz2-fmaaa-aaaaa-qaaaq-cai"
		}
	}
});
