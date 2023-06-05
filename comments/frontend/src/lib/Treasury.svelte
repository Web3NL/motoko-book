<script lang="ts">
	import { treasury } from './api';
	import { onMount } from 'svelte';

	let amount: string;

	onMount(async () => {
		amount = Number(await treasury()).toLocaleString();
	});
</script>

<span class="text-tertiary-900">
	Treasury: <span class="font-medium text-xl">{amount}</span>
</span>
