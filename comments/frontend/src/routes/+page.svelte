<script lang="ts">
	import Comments from '$lib/Comments.svelte';
	import User from '$lib/User.svelte';
	import { LightSwitch } from '@skeletonlabs/skeleton';
	import { AppBar } from '@skeletonlabs/skeleton';
	import Auth from '$lib/Auth.svelte';
	import Treasury from '$lib/Treasury.svelte';
</script>

<div class="max-w-xl p-2 mx-auto">
	<div class="flex flex-row-reverse">
		<div class="m-4 pt-1">
			<LightSwitch />
		</div>
		<div class="m-4">
			<Treasury />
		</div>
	</div>
	<div>
		<AppBar>
			<svelte:fragment slot="lead">
				<h1 class="h2 m-4">Web3 Comments</h1>
			</svelte:fragment>
			
			<svelte:fragment slot="trail">
				<div class="m-4">
					<Auth />
				</div>
			</svelte:fragment>
		</AppBar>
	</div>
	<User />
	<Comments />
</div>
