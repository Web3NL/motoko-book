<script lang="ts">
	import { authStore, isSignedIn } from '$lib/auth.store';
	import { getActor } from '$lib/actor.store';
	import Button from '$lib/Button.svelte';
	import Comments from '$lib/Comments.svelte';
	import { onMount } from 'svelte';
	import type { QueryComment } from '../declarations/comments.did';

	let comments : QueryComment[] = [];

	// let user : [] | [[bigint, bigint, bigint]] = []; 
	onMount(async () => {
		const actor = await getActor();

		comments = await actor.latestComments();
		
		// const user = await actor.user();
	});


	const like = (event : CustomEvent) => console.log(event.detail);
	
</script>

<div class="text-2xl">
	{#if $isSignedIn}
		<Button onClick={authStore.signOut} text="Logout" />
	{:else}
		<Button onClick={authStore.signIn} text="Login with II" />
	{/if}
	<br />
	<Comments {comments} on:message="{like}" />
</div>
