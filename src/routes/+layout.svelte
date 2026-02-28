<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import '../styling.css';
	let { children } = $props();
	import { onMount } from 'svelte';

	// in +layout.svelte
	onMount(() => {
		if ('serviceWorker' in navigator) {
			navigator.serviceWorker.register('/sw.js').then((reg) => {
				reg.addEventListener('updatefound', () => {
					const newSW = reg.installing;
					//@ts-ignore
					newSW.addEventListener('statechange', () => {
						//@ts-ignore
						if (newSW.state === 'activated') {
							window.location.reload();
						}
					});
				});
			});
		}
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children()}
