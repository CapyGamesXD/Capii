<script>
	let date = new Date();

	$: hours = date.getHours();
	$: minutes = date.getMinutes();
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	<h1>{hours}:{minutes}</h1>
	<h2>Disclaimer: This is still a work-in-progress site. :D</h2>
</div>
