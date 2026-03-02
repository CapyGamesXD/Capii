<script>
	import { version } from '$lib/versions';
	import { onMount } from 'svelte';

	let apps = [
		{ name: 'Time App', href: '/' },
		{ name: 'Capy App!', href: 'capy' },
		{ name: 'Stopwatch', href: 'stopwatch' },
		{ name: 'Settings', href: 'settings' },
		{ name: 'Square (display testing)', href: 'square' }
	];

	onMount(() => {
		// @ts-ignore
		let savedItems = JSON.parse(localStorage.getItem('storedPrograms') || '[]');
		// @ts-ignore
		apps = [...apps, ...savedItems.map((p) => ({ name: p.nameSave, href: p.href }))];
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
