<script lang="ts">
	import type { QueryComment, CommentHash, LikeResult } from '$declarations/commentsbackend.did';
	import { authStore } from '$lib/auth.store';
	import Button from '$lib/Button.svelte';
	import { like } from './api';

	export let queryComment: QueryComment;

	let likeButton = 'LIKE';

	const postLike = async (hash: CommentHash) => {
		likeButton = '...';

		const result : LikeResult = await like(hash);

		if ('ok' in result) {
			queryComment.reward = result.ok;
			likeButton = 'LIKED';
		} else if ('err' in result) {
			'AnonNotAllowed' in result.err ? likeButton = "Anon not allowed" : {};
			'AlreadyLiked' in result.err ? likeButton = 'LIKED' : {};
			'TimeRemaining' in result.err
				? (likeButton = 'Wait ' + Math.round(Number(result.err.TimeRemaining) / 10**9) + ' seconds')
				: {};
		}
	};

	const created = new Date(Number(queryComment.created) / 1000000).toLocaleString();
</script>

<div class="card mt-4">
	<div class="pr-28 pb-10 relative">

		<div class="p-6 text-xl w-full break-words h-60">
			{queryComment.comment}
		</div>

		<div class="p-5 absolute top-0 right-0">
			<p class="h2">{queryComment.reward}</p>
			<span class="text-tertiary-900">Reward</span>
		</div>

		<span class="text-tertiary-900 pl-5 pb-1 absolute bottom-0 left-0">{created} by {queryComment.userId}</span>

		{#if $authStore.isAuthenticated}
			<div class="p-4 absolute right-0 bottom-0">
				<Button text={likeButton} on:click={() => postLike(queryComment.hash)} />
			</div>
		{/if}

	</div>
</div>

<style>
</style>
