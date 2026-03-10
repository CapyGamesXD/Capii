<script>
	import { onMount } from 'svelte';

	let lat = localStorage.getItem('lat') || 0;
	let lon = localStorage.getItem('lon') || 0;
	let temp = Number();
	let hum = Number();
	let cond = '';
	let city = '';
	async function getGeo() {
		if (lat == 0 || lon == 0) {
			const url = 'https://ipapi.co/json/';
			try {
				const response = await fetch(url);
				if (!response.ok) {
					throw new Error(`Response status: ${response.status}`);
				}

				const result = await response.json();

				lat = result.latitude;

				lon = result.longitude;

				localStorage.setItem('lat', lat.toString());
				localStorage.setItem('lon', lon.toString());

				console.log(localStorage.getItem('lat'));
				cond = result.weather.main;
				city = result.city;
			} catch (error) {
				// @ts-ignore
				console.error(error.message);
			}
		}
	}

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
	}

	onMount(async () => {
		await getGeo();
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
	<p>{city}</p>
	<div class="divider"></div>

	<p></p>
	<h1>{temp.toPrecision(3)}ºc</h1>
	<h1>{hum.toPrecision(3)}%</h1>

	<div class="divider"></div>

	<p>Lat: {lat} <br /> Lon: {lon}</p>
</div>
