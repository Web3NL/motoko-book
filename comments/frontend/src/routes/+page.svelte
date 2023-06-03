<script lang="ts">
	import { authStore } from '$lib/auth.store';
	// import { get } from 'svelte/store';
	// import Button from '$lib/Button.svelte';
	import Comments from '$lib/Comments.svelte';
	import { onMount } from 'svelte';
	import type { QueryComment } from '../declarations/comments.did';
	// import User from '$lib/User.svelte';
	// import Post from '$lib/Post.svelte';
	
	import { latestComments } from '$lib/api';
	

	let comments : QueryComment[] = [];

	// let user : [] | [[bigint, bigint, bigint]] = []; 

	onMount(async () => {
		comments = await latestComments();
	});

</script>

<div>
	
	
	<Comments {comments} />
</div>
