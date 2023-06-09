<script lang="ts">
	import type { QueryUser } from '$declarations/commentsbackend.did';
	import { userStore } from '$lib/user.store';
	import { onMount } from 'svelte';
	import Post from './Post.svelte';

	let user: QueryUser | null | undefined = null;

	const updateUser = async () => await userStore.update();

	onMount(async () => {
		user = $userStore;
	});

	$: user = $userStore;
</script>

{#if user}
	<div class="mr-3 ml-3 mt-5 mb-5 flex justify-between ">
		<div>
			<p class="h2">User{user.id}</p>
			<span class="text-tertiary-900">Logged in</span>
		</div>
		<div>
			<p class="h2">{user.balance}</p>
			<span class="text-tertiary-900">Balance</span>
		</div>
	</div>
	
	<Post on:updateUser={updateUser}/>
{/if}
