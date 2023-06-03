<script lang="ts">
    import { authStore } from '$lib/auth.store';
    import { onMount } from 'svelte';
    import Button from '$lib/Button.svelte';

    let isAuthenticated = $authStore.isAuthenticated;

    // onMount(async () => {
    // });

    $: isAuthenticated = $authStore.isAuthenticated;
</script>

{#if isAuthenticated}
    <Button text="LOGOUT" on:click={() => authStore.signOut()} />
{:else}
    <Button text="LOGIN" on:click={() => authStore.signIn()} />
{/if}