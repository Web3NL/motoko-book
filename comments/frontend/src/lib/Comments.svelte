<script lang="ts">
    import { getActor } from '$lib/actor.store';
</script>

{#await getActor()}
    Loading...
{:then actor} 
    console.log(actor.latestComments())
{/await}