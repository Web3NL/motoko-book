<script lang="ts">
	import { authStore, isSignedIn } from '$lib/auth.store';
	import { getActor } from '$lib/actor.store';
	import Button from '$lib/Button.svelte';
	import User from '$lib/User.svelte';
	import Post from '$lib/Post.svelte';
	import Comments from '$lib/Comments.svelte';
	import { onMount } from 'svelte';

	onMount(async () => {
		const actor = await getActor();
		
		const user = await actor.user();
		
		let comments
		if (user.length === 0) {
			
		}
	});
</script>

<div class="text-2xl">
	{#if $isSignedIn}
		<User />
		<Button onClick={authStore.signOut} text="Logout" />
		<Post />
	{:else}
		<Button onClick={authStore.signIn} text="Login with II" />
	{/if}
	<br />
	<Comments />
</div>
