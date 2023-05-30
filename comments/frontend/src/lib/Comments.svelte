<script lang="ts">
	import { getActor } from '$lib/actor.store';
	import { onMount } from 'svelte';
	import type { QueryComment } from '../declarations/comments.did';

	let comments: QueryComment[] = [];

	onMount(async () => {
		const actor = await getActor();
		comments = await actor.latestComments();
	});
</script>

{#each comments as comment}
	<div>
		<p>{comment.comment}</p>
		<p>{comment.userId}</p>
	</div>
{/each}
