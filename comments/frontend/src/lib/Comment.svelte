<script lang="ts">
	import type { QueryComment } from '../declarations/comments.did';
	import type { CommentHash } from '../declarations/comments.did';

    import { getActor } from '$lib/actor.store';
    import { isSignedIn } from '$lib/auth.store';

	export let queryComment: QueryComment;

    const like = async (hash : CommentHash) => {
        const actor = await getActor();
        const result = await actor.likeComment(hash);

        result.length === 0 ? queryComment. 
    }
</script>

<div>
	<p>{queryComment.comment}</p>
	<p>{queryComment.userId}</p>
	<p>{queryComment.userBalance}</p>

    {#if $isSignedIn}
        <button on:click={() => like(queryComment.hash)}>LIKE</button>
    {:else}
        Sign in to like
    {/if}
	
</div>
