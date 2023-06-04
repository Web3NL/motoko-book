<script lang="ts">
	import Comments from '$lib/Comments.svelte';
	import { onMount } from 'svelte';
	import type { QueryComment } from '../declarations/comments.did';
	import User from '$lib/User.svelte';
	import { LightSwitch } from '@skeletonlabs/skeleton';
	import { AppBar } from '@skeletonlabs/skeleton';
	import { latestComments } from '$lib/api';
	import Auth from '$lib/Auth.svelte';

	let comments : QueryComment[] = [];

	onMount(async () => {
		comments = await latestComments();
	});

</script>

<div class="max-w-xl p-2 mx-auto">
	<div>
		<AppBar>
			<svelte:fragment slot="lead"><Auth /></svelte:fragment>
			<h1 class="h2">Web3 Comments</h1>
			<svelte:fragment slot="trail"><LightSwitch /></svelte:fragment>
		</AppBar>
	</div>
	<User />
	<Comments {comments} />
</div>
