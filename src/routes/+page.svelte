<script>
	import { onMount } from 'svelte';

	let date = new Date();

	$: hours = date.getHours();
	$: minutes = date.getMinutes();
	$: day = date.getDate();
	$: month = date.getMonth() + 1;
	$: year = date.getFullYear();

	let lat = localStorage.getItem('lat') || 0;
	let lon = localStorage.getItem('lon') || 0;
	let temp = Number();
	let hum = Number();

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
				const city = result.city;

				localStorage.setItem('lat', lat.toString());
				localStorage.setItem('lon', lon.toString());
				localStorage.setItem('city', city.toString());

				console.log(localStorage.getItem('lat'));
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

	setInterval(() => {
		date = new Date();
	}, 1000);
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<a href="selector" class="nodecor">
	<div class="fullcenterdiv">
		<h1>{hours.toString().padStart(2, '0')}:{minutes.toString().padStart(2, '0')}</h1>
		<h4>{day}/{month}/{year}</h4>
		<h4>{temp.toPrecision(3)}ºc</h4>
	</div>
</a>
