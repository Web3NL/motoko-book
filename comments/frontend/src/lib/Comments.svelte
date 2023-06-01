<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import { createEventDispatcher } from 'svelte';

	export let comments: QueryComment[] = [];

	const dispatch = createEventDispatcher();

	const like = (hash : number) => {
		dispatch('message', hash);
	};
</script>

{#each comments as comment}
	<div>
		<p>{comment.comment}</p>
		<p>{comment.userId}</p>
		<p>{comment.userBalance}</p>
		<button on:click="{() => like(comment.hash)}">LIKE</button>
	</div>
{/each}
