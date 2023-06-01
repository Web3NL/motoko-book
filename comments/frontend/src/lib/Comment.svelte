<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import type { CommentHash } from '../declarations/comments.did';

    import { isSignedIn } from '$lib/auth.store';

	export let queryComment: QueryComment;

    const like = async (hash : CommentHash) => {
    }
</script>

<div>
	<p>{queryComment.comment}</p>
	<p>{queryComment.userId}</p>
	<p>{queryComment.reward}</p>

    {#if $isSignedIn}
        <button on:click={() => like(queryComment.hash)}>LIKE</button>
    {:else}
        Sign in to like
    {/if}
	
</div>

<style>
    p, button {
        padding: 2px;
        background-color: aliceblue;
    }
</style>
