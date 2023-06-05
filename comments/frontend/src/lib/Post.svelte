<script lang="ts">
	import { onMount } from 'svelte';
	import { postComment } from './api';
	import Button from '$lib/Button.svelte';
	import { commentsStore } from './comments.store';

	let comment: string;
	let input: HTMLInputElement;

	let text = 'Submit';

	onMount(async () => {
		input = document.getElementById('comment') as HTMLInputElement;
	});

	const post = async () => {
		input.disabled = true;
		text = 'Posting...';

		const result = await postComment(comment);

		if ('ok' in result) {
            comment = "";
			await commentsStore.update();
		} else if ('err' in result) {
			'AnonNotAllowed' in result.err ? (comment = 'Anon not allowed!') : {};
			'InvalidComment' in result.err ? (comment = 'Invalid comment!') : {};
			'TimeRemaining' in result.err
				? (comment = 'Time remaining: ' + result.err.TimeRemaining)
				: {};
		}

		input.disabled = false;
		text = 'Submit';
	};
</script>

<div class="flex justify-between mb-10">
	<label class="label flex-grow mr-4">
		<input bind:value={comment} id="comment" class="input" type="text" placeholder="Comment" />
	</label>
	<Button {text} on:click={post} />
</div>
