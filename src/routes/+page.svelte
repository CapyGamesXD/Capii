<script>
	let date = new Date();

	$: hours = date.getHours();
	$: minutes = date.getMinutes();

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
	<div class="centerdiv">
		<h1>{hours.toString().padStart(2, '0')}:{minutes.toString().padStart(2, '0')}</h1>
	</div>
</a>
