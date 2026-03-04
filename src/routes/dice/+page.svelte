<script>
	let range = Number(2);
	let result = Number();

	function addNum() {
		range += 1;
	}
	function subNum() {
		if (range > 2) {
			range -= 1;
		}
	}
	function bigaddNum() {
		range += 10;
	}
	function bigsubNum() {
		if (range > 11) {
			range -= 10;
		}
	}
	function calculate() {
		result = Math.floor(Math.random() * range + 1);
	}

	calculate();
</script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=SN+Pro:ital,wght@0,200..900;1,200..900&display=swap"
	rel="stylesheet"
/>

<div class="centerdiv">
	<a class="back" href="selector">Back</a>
	<h2>Random Number</h2>
	<h1>{result}</h1>
	<div class="divider"></div>
	<h3>Range:</h3>
	<div class="rowDiv">
		<button class="smallButton" on:click={bigaddNum}> +10 </button>
		<button class="smallButton" on:click={addNum}> + </button>
		<h1>{range}</h1>
		<button class="smallButton" on:click={subNum}> - </button>
		<button class="smallButton" on:click={bigsubNum}> -10 </button>
	</div>
	<button class="back" on:click={calculate}> Run </button>
</div>
