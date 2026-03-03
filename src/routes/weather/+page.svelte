<script>
	import { onMount } from 'svelte';

	let lat = Number();
	let lon = Number();
	let temp = Number();
	let hum = Number();
	async function getGeo() {
		const url = 'https://ipapi.co/json/';
		try {
			const response = await fetch(url);
			if (!response.ok) {
				throw new Error(`Response status: ${response.status}`);
			}

			const result = await response.json();

			lat = result.latitude;
			lon = result.longitude;
		} catch (error) {
			// @ts-ignore
			console.error(error.message);
		}
		fetchWeater();
	}

	async function fetchWeater() {
		const send = await fetch('/api', {
			method: 'POST',
			body: JSON.stringify({ lat, lon }),
			headers: {
				'Content-Type': 'application/json'
			}
		});
		const { data } = await send.json();

		temp = data.main.temp - 273.15;
		hum = data.main.humidity;
	}

	onMount(() => {
		getGeo();
		setInterval(() => {
			fetchWeater();
		}, 300000);
	});
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	<a class="back" href="selector">Back</a>
	<div class="divider"></div>

	<h1>{temp.toPrecision(3)}ºc</h1>
	<h1>{hum.toPrecision(3)}%</h1>

	<div class="divider"></div>

	<p>Lat: {lat} <br /> Lon: {lon}</p>
</div>
