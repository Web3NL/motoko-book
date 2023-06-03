<script lang="ts">
	import type { QueryUser } from '../declarations/comments.did';
	import { userStore } from '$lib/user.store';
	import { onMount } from 'svelte';

	let user: QueryUser | null | undefined = null;

	onMount(async () => {
		user = $userStore;
	});

	$: user = $userStore;
</script>

{#if user}
	<div>
		<p>UserId: User{user.id}</p>
		<p>Balance: {user.balance}</p>
	</div>
{/if}
