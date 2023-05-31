<script lang="ts">
	export let userId : bigint;
	export let balance : bigint;
	export let lastPost : bigint;

	const MAX_INTERVAL_USER = 600 * 10 ** 9;
</script>

<div>
	<p>UserId: {userId}</p>
	<p>Balance: {balance}</p>
</div>
