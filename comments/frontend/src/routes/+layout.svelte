<script lang="ts">
	import { authStore } from '$lib/auth.store';
</script>

is signed in = {$authStore}<br />
<button on:click={() => authStore.signIn()}>SIGNIN</button><br />
<button on:click={() => authStore.signOut()}>SIGNOUT</button><br />

{#await authStore.identity() then id}
	ID = {id?.getPrincipal().toString()}<br />
{/await}

<slot />

<style>
	@import '../app.postcss';
</style>
