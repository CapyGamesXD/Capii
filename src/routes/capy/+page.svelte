<script>
	// @ts-ignore
	let capy = '';
	async function fetchCapy() {
		// @ts-ignore
		let response = await fetch('https://api.capy.lol/v1/capybara?json=true');
		// @ts-ignore
		let reply = await response.json();
		// @ts-ignore
		capy = reply.data.url;

		console.log(capy);
	}

	fetchCapy();
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="fullcenterdiv">
	<a class="back" href="selector">Back</a>
	<img src={capy} />
	<button on:click={fetchCapy}>Refresh</button>
</div>
