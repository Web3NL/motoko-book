<script lang="ts">
	import { getActor } from '$lib/actor.store';

    const MAX_INTERVAL_USER = 600 * 10**9; 
</script>

{#await getActor()}
	Loading...
{:then actor}
	{#await actor.user()}
		Loading...
	{:then user}
		{#if user.length === 0}
			<div>
			</div>
		{:else}
			<div>
				<p>UserId: {user[0][0]}</p>
				<p>Balance: {user[0][1]}</p>
                {#if user[0][2] < MAX_INTERVAL_USER}
			</div>
		{/if}
	{/await}
{/await}
