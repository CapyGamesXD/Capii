<script>
	import { version } from '$lib/versions';

	let apps = [
		{ name: 'Time App', href: '/' },
		{ name: 'Capy App!', href: 'capy' },
		{ name: 'Stopwatch', href: 'stopwatch' }
	];
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	{#each apps as app}
		<a href={app.href} class="selectA">{app.name}</a>
		<div class="divider"></div>
	{/each}

	<p>Version: {version}. <a href="logs">See update logs</a></p>
</div>
