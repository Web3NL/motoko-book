<script lang="ts">
    import { getActor } from '$lib/actor.store';
</script>

{#await getActor()}
    Loading...
{:then actor} 
    {#await actor.latestComments()}
        Loading...
        
    {:then comments}
         {#each comments as comment}
            <div>
                <p>{comment.comment}</p>
                <p>{comment.userId}</p>
            </div>
         {/each}
        
    {/await}
{/await}