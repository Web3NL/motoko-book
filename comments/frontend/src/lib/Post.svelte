<script lang="ts">
	import { authStore } from '$lib/auth.store';
	import { onMount } from 'svelte';

    import { postComment } from './api';
    import Button from '$lib/Button.svelte';
	// import type { PostResult, PostError } from '../declarations/comments.did';
    import {AnonymousIdentity} from '@dfinity/agent';

	let comment: string;
    let input : HTMLInputElement;

    let text = "Submit";

    onMount(async () => {
        input = document.getElementById("comment") as HTMLInputElement;
    });

	const post = async () => {
        

        input.disabled = true;
        text = "Posting...";

		const result = await postComment(comment);
		
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
	<form on:submit={post}>
		<input id="comment" type="text" bind:value={comment} />
		<Button {text} on:click={post} />
	</form>
</div>
id = {$authStore.identity?.getPrincipal().toString()}
anon = {(new AnonymousIdentity()).getPrincipal().toString()}