<script lang="ts">
	import { authStore, isSignedIn } from '$lib/auth.store';
	import { getActor } from '$lib/actor';
	import Button from '$lib/Button.svelte';
	import Comments from '$lib/Comments.svelte';
	import { onMount } from 'svelte';
	import type { QueryComment } from '../declarations/comments.did';
	import User from '$lib/User.svelte';
	import Post from '$lib/Post.svelte';

	let comments : QueryComment[] = [];

	let user : [] | [[bigint, bigint, bigint]] = []; 

	onMount(async () => {
		const actor = await getActor();

		comments = await actor.latestComments();
		
		const user = await actor.user();
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
	<Comments {comments} />
</div>
