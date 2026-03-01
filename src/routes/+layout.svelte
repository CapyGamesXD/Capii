<script lang="ts">
	import favicon from '$lib/assets/favicon.svg';
	import { register } from 'module';

	import '../styling.css';
	let { children } = $props();
	import { onMount } from 'svelte';

	onMount(() => {
		navigator.serviceWorker.register('/sw.js').then((res) =>
			res.addEventListener('updatefound', () => {
				const newestWorker = res.installing;
				if (newestWorker?.state === 'activated') {
					window.location.reload();
				}
			})
		);
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

{@render children()}
