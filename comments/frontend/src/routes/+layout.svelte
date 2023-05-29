<script lang="ts">
	import { authStore, isSignedIn } from '$lib/auth.store';
	import { browser } from '$app/environment';

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

<svelte:window on:storage={syncAuthStore} />

{#await syncAuthStore()}
	Loading...
{:then _}
	<slot />
{/await}

<style>
	@import '../app.postcss';
</style>
