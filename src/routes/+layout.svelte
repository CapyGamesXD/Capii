<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import '../styling.css';
	let { children } = $props();
	import { onMount } from 'svelte';

	onMount(() => {
		if ('serviceWorker' in navigator) {
			navigator.serviceWorker;
		}
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children()}
