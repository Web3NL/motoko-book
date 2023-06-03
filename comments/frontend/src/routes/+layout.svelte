<script lang="ts">
	import { authStore } from '$lib/auth.store'; 
	import { Actor } from '@dfinity/agent';
	import { onMount } from 'svelte';

	let principal : string | undefined = undefined;
	let actorId : string | undefined = undefined;

	onMount(async () => {
		await authStore.sync();
	});
</script>

is signed in = {$authStore.isAuthenticated}<br />

<button on:click={() => authStore.signIn()}>SIGNIN</button><br />
<button on:click={() => authStore.signOut()}>SIGNOUT</button><br />

ID = {$authStore.identity?.getPrincipal()}<br />

Actor id = {$authStore.actor}

<slot />

<style>
	@import '../app.postcss';
</style>
