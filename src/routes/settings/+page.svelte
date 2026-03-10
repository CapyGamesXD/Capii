<script>
	import { goto } from '$app/navigation';

	function autoUpdate() {
		location.reload();
	}
	let nameInput = $state('');
	let urlInput = $state('');
	let storedPrograms = JSON.parse(localStorage.getItem('storedPrograms') || '[]');
	function save() {
		if (nameInput != '' && urlInput != '') {
			storedPrograms = [...storedPrograms, { name: nameInput, href: urlInput }];
			localStorage.setItem('storedPrograms', JSON.stringify(storedPrograms));
		}
		goto('/selector');
	}

	function remove() {
		localStorage.clear();
		goto('/selector');
	}

	function clearIP() {
		localStorage.removeItem('lat');
		localStorage.removeItem('lon');
		localStorage.removeItem('city');

		goto('/selector');
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
	<h3>Settings:</h3>
	<a href="about" class="back">About</a>
	<button on:click={autoUpdate}>Auto-update</button>
	<div class="divider"></div>
	<h3>Developer Panel</h3>

	<a href="square" class="back">Display Warping Check</a>
	<div class="divider"></div>
	<h4>Add Program:</h4>
	<div class="divider"></div>
	<p>Name:</p>
	<input bind:value={nameInput} />
	<p>URL:</p>
	<input bind:value={urlInput} />
	<button on:click={save}>Add</button>
	<div class="divider"></div>
	<button on:click={clearIP}>Re-call IP</button>
	<button on:click={remove}>Clear Apps</button>
</div>
