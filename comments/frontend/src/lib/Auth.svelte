<script lang="ts">
    import { authStore } from '$lib/auth.store';
    import { userStore } from '$lib/user.store';

    import Button from '$lib/Button.svelte';
    
    $: isAuthenticated = $authStore.isAuthenticated;

    const login = async () => {
        await authStore.signIn();
        await userStore.update();
    };
</script>

{#if isAuthenticated}
    <Button text="LOGOUT" on:click={() => authStore.signOut()} />
{:else}
    <Button text="LOGIN" on:click={() => login()} />
{/if}