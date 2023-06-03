<script lang="ts">
	// Your selected Skeleton theme:
	import '@skeletonlabs/skeleton/themes/theme-crimson.css';

	// This contains the bulk of Skeletons required styles:
	// NOTE: this will be renamed skeleton.css in the v2.x release.
	import '@skeletonlabs/skeleton/styles/skeleton.css';

	// Finally, your application's global stylesheet (sometimes labeled 'app.css')
	import '../app.postcss';
	import { AppBar } from '@skeletonlabs/skeleton';
	import { authStore } from '$lib/auth.store';
	import { onMount } from 'svelte';
	import { LightSwitch } from '@skeletonlabs/skeleton';
	import Auth from '$lib/Auth.svelte';
	onMount(async () => {
		await authStore.sync();
	});
</script>
<AppBar>
	<svelte:fragment slot="lead"><Auth /></svelte:fragment>
	<svelte:fragment slot="trail"><LightSwitch /></svelte:fragment>
	<svelte:fragment slot="headline"><h1 class="h1">Tokenized Comments</h1></svelte:fragment>
</AppBar>

<slot />


<style>
	/* @import '../app.postcss'; */
</style>
