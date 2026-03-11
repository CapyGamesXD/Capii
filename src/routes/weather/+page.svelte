<script>
	import { onMount } from 'svelte';

	let lat = localStorage.getItem('lat') || 0;
	let lon = localStorage.getItem('lon') || 0;
	let temp = Number();
	let hum = Number();
	let cond = 'Fetching Conditions...';
	let city = localStorage.getItem('city') || 'Fetching Location...';

	async function fetchWeather() {
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
		cond = data.weather[0].description;

		cond = cond
			.toLowerCase()
			.split(' ')
			.map((s) => s.charAt(0).toUpperCase() + s.substring(1))
			.join(' ');

		console.log(cond);
	}

	onMount(async () => {
		fetchWeather();
		setInterval(() => {
			fetchWeather();
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

	<p>{city}</p>
	<h1>{temp.toPrecision(3)}ºc</h1>
	<h1>{hum.toPrecision(3)}%</h1>
	<p class="cond">{cond}</p>

	<div class="divider"></div>

	<p>Lat: {lat} <br /> Lon: {lon}</p>
</div>
