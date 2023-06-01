<script lang="ts">
	import { user } from './api';
	import type {User} from '../declarations/comments.did';
	import { onMount } from 'svelte';


	let _user : User;

	onMount(async () => {
		const result = await user();
		console.log(result);
		if (result.length !== 0) {
			_user = result[0];
		}
	});
</script>

{#if _user}
<div>
	<p>UserId: User{_user.id}</p>
	<p>Balance: {_user.balance}</p>
</div>
{/if}

