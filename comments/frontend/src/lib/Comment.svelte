<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import type { CommentHash } from '../declarations/comments.did';
	import { authStore } from '$lib/auth.store';
	import Button from '$lib/Button.svelte';

	export let queryComment: QueryComment;

	const created = new Date(Number(queryComment.created) / 1000000).toLocaleString();

	const like = async (hash: CommentHash) => {
		$authStore.actor.likeComment(hash);
	};
</script>

<div class="card mt-4">
	<div class="flex justify-between">
		<p class="p-6 text-xl max-w-full flex-wrap flex-grow flex-shrink overflow-auto min-w-0">{queryComment.comment}</p>

		<div class="p-5">
			<p class="h2">{queryComment.reward}</p>
			<span class="text-tertiary-900">Reward</span>
		</div>
	</div>

	<div class="flex justify-between">
		<span class="text-tertiary-900 pl-5 pt-10">{created} by {queryComment.userId}</span>
		{#if $authStore.isAuthenticated}
			<div class="p-4">
				<Button text="LIKE" on:click={() => like(queryComment.hash)} />
			</div>
		{/if}
	</div>
</div>

<!-- <div class="mr-3 ml-3 mt-5 mb-5 flex justify-between ">
	<div>
		<p class="h2">User{user.id}</p>
		<span class="text-tertiary-900">Logged in</span>
	</div>
	<div>
		<p class="h2">{user.balance}</p>
		<span class="text-tertiary-900">Balance</span>
	</div>
</div> -->

<style>
</style>
