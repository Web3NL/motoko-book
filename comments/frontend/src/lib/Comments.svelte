<script lang="ts">
	import Comment from './Comment.svelte';
	import { commentsStore } from '$lib/comments.store';

	$: comments = $commentsStore;
</script>

{#each comments as queryComment}
	<Comment {queryComment} />
{/each}
