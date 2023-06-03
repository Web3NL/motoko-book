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


<div class="max-w-xl p-2 mx-auto">
	<AppBar>
		<svelte:fragment slot="lead"><Auth /></svelte:fragment>
		<h1 class="h2">Web3 Comments</h1>
		<svelte:fragment slot="trail"><LightSwitch /></svelte:fragment>
	</AppBar>
	
	<slot />
</div>


<style>
	/* @import '../app.postcss'; */
</style>
