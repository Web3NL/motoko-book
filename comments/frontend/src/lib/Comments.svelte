<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import { latestComments } from './api';
	import Comment from './Comment.svelte';
	import { onMount } from 'svelte';

	export let comments: QueryComment[] = [];

	onMount(async () => {
		comments = await latestComments();
	});

</script>

{#each comments as queryComment}
	<Comment {queryComment} />
{/each}
