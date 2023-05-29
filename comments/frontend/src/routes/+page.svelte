<script lang="ts">
	import { authStore, isSignedIn } from '$lib/auth.store';
	import Button from '$lib/Button.svelte';

</script>

<div class="text-2xl">
Signed in: {$isSignedIn}<br />
Id: {$authStore.identity?.getPrincipal()}<br />

{#if $isSignedIn}
	<Button onClick={authStore.signOut} text="Logout" />
{:else}
	<Button onClick={authStore.signIn} text="Login with II" />
{/if}
</div>
    
