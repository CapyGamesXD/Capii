<script>
	import { version, logs } from '$lib/versions';

	function autoUpdate() {
		location.reload();
	}
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	<a class="back" href="selector">Back</a>
	<h2>Version {version}</h2>
	<p>{logs}</p>
	<button on:click={autoUpdate}>Auto-update</button>
</div>
