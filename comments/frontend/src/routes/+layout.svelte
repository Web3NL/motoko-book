<script lang="ts">
	import { authSignedInStore, authStore } from '$lib/auth.store';
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

	const login = () => authStore.signIn()

	// $: worker, $authStore, (() => worker?.syncAuthIdle($authStore))();
</script>

<svelte:window on:storage={syncAuthStore} />

{#await syncAuthStore()}
	Loading...
{:then _}
	Signed in: {$authSignedInStore}<br />
	Id: {$authStore.identity}<br />
	<button on:click={login}>Sign in</button>
	<slot />
{/await}

<style>
	@import '../app.postcss';
</style>
