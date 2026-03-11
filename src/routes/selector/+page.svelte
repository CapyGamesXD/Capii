<script>
	import { version } from '$lib/versions';
	import { onMount } from 'svelte';

	let apps = [
		{ name: 'Dashboard', href: '/' },
		{ name: 'Stopwatch', href: 'stopwatch' },
		{ name: 'Weather', href: 'weather' },
		{ name: 'Dice', href: 'dice' },
		{ name: 'Capy App!', href: 'capy' },
		{ name: 'Settings', href: 'settings' }
	];

	onMount(() => {
		// @ts-ignore
		let savedItems = JSON.parse(localStorage.getItem('storedPrograms') || []);
		// @ts-ignore
		apps = [...apps, ...savedItems];
		console.log(apps);
	});
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	<p class="apptitle">Programs</p>
	<div class="list">
		{#each apps as app}
			<a href={app.href} class="selectA">{app.name}</a>
			<div class="divider"></div>
		{/each}
	</div>

	<p>Version: {version} <a href="logs">See update logs</a></p>
</div>
