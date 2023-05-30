<script lang="ts">
	import { getActor } from '$lib/actor.store';
	import { onMount } from 'svelte';
	import type { PostResult, PostError } from '../declarations/comments.did';

	let comment: string = "";
    let input : HTMLInputElement;

    onMount(async () => {
        input = document.getElementById("comment") as HTMLInputElement;
    });

	const post = async () => {
        input.disabled = true;
		const actor = await getActor();
		const result = await actor.postComment(comment);
		
        if ('ok' in result) {
            window.location.reload();
        } else if ('err' in result) {
            'AnonNotAllowed' in result.err ? comment = "Anon not allowed!" : {};
            'InvalidComment' in result.err ? comment = "Invalid comment!" : {};
            'TimeRemaining' in result.err ? window.location.reload() : {};
        };
	};
</script>

<div>
	<form on:submit|preventDefault={post}>
		<input id="comment" type="text" bind:value={comment} />
		<button type="submit">Submit</button>
	</form>
</div>
