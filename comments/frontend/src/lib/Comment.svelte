<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import type { CommentHash } from '../declarations/comments.did';
	import { authStore } from '$lib/auth.store';

	export let queryComment: QueryComment;

	const created = new Date(Number(queryComment.created) / 1000000).toLocaleDateString();

	const like = async (hash: CommentHash) => {
		$authStore.actor.likeComment(hash);
	};
</script>

<div class="card">
	<header class="card-header">
		{created} by {queryComment.userId}
		Comment Reward: {queryComment.reward}
	</header>
	<section class="p-4">{queryComment.comment}</section>
	<footer class="card-footer">
		{#if $authStore.isAuthenticated}
			<button type="button" class="btn variant-filled" on:click={() => like(queryComment.hash)}>
				LIKE
			</button>
		{/if}
	</footer>
</div>
<div>
	<p>{queryComment.comment}</p>
	<p />
	<p />
</div>

<style>
</style>
