<script lang="ts">
	// Preserve the order of these imports
	import '@skeletonlabs/skeleton/themes/theme-crimson.css';
	import '@skeletonlabs/skeleton/styles/skeleton.css';
	import '../app.postcss';

	import { browser } from '$app/environment';
	import { authStore } from '$lib/auth.store';

	const init = async () => Promise.resolve(syncAuthStore());

	const syncAuthStore = async () => {
		if (!browser) {
			return;
		}
		try {
			await authStore.sync();
		} catch (err: unknown) {
			console.error(err);
		}
	};
</script>

{#await init()}
	Loading...
{:then _}
	<slot />
{/await}

<style>
	/* @import '../app.postcss'; */
</style>
