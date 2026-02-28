<script>
	import { onMount } from 'svelte';

	let seconds = Number(0);
	let result = '00:00:00';
	// @ts-ignore
	let interval;
	let started = false;

	// @ts-ignore

	onMount(() => {
		// @ts-ignore
		return () => clearInterval(interval);
	});

	function start() {
		if (started == false) {
			started = true;
			interval = setInterval(() => {
				// @ts-ignore
				const date = new Date(null);
				seconds++;
				date.setSeconds(seconds);
				result = date.toISOString().slice(11, 19);
				console.log(seconds);
				// @ts-ignore
			}, 1000);
		}
	}
	function pause() {
		started = false;
		// @ts-ignore
		clearInterval(interval);
	}
	function reset() {
		started = false;
		// @ts-ignore
		clearInterval(interval);
		seconds = 0;
		result = '00:00:00';
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
	<h2>{result}</h2>
	<div class="row">
		<button on:click={start}>Start</button>
		<button on:click={pause}>Pause</button>
		<button on:click={reset}>Reset</button>
	</div>
</div>
