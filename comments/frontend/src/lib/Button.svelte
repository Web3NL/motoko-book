<script>
	export let text = 'Button Text';
	export let onClick = async () => {};
</script>

<button
	class="bg-zinc-500 hover:bg-zinc-600 text-white font-bold py-2 px-4 rounded"
	on:click={onClick}>{text}</button
>
