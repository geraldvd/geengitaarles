<script>
	import DrumAnimation from '$lib/DrumAnimation.svelte';
	import '@fontsource/grechen-fuemen';

	let isPlaying = false;

	function togglePlay() {
		isPlaying = !isPlaying;
	}
</script>

<div class="min-h-screen bg-black text-white flex flex-col items-center justify-center">
	<h1 class="text-4xl md:text-6xl font-bold mb-8 blinking text-center">Geen Gitaarles</h1>
	<div class="flex justify-center space-x-4 mb-8">
		<div class="h-12 w-12 md:h-24 md:w-24 bg-red-500 rounded-full animate-pulse"></div>
		<div class="h-12 w-12 md:h-24 md:w-24 bg-green-500 rounded-full animate-pulse"></div>
		<div class="h-12 w-12 md:h-24 md:w-24 bg-blue-500 rounded-full animate-pulse"></div>
	</div>
	<button on:click={togglePlay} class="px-4 py-2 bg-purple-500 rounded-full text-white font-bold">
		{isPlaying ? 'Stop Drums' : 'Play Drums'}
	</button>

	{#if isPlaying}
		<div class="mt-8 grid grid-cols-3 gap-4">
			<div class="h-12 w-12 md:h-16 md:w-16 bg-yellow-500 rounded-full animate-ping"></div>
			<div class="h-12 w-12 md:h-16 md:w-16 bg-indigo-500 rounded-full animate-ping"></div>
			<div class="h-12 w-12 md:h-16 md:w-16 bg-pink-500 rounded-full animate-ping"></div>
		</div>
		<div class="m-8">
			<div class="h-64 bg-gray-700 rounded-full border-white"><DrumAnimation /></div>
		</div>
		<div class="mt-4 grid grid-cols-3 gap-4">
			<div class="h-12 w-12 md:h-16 md:w-16 bg-yellow-500 rounded-full animate-ping"></div>
			<div class="h-12 w-12 md:h-16 md:w-16 bg-indigo-500 rounded-full animate-ping"></div>
			<div class="h-12 w-12 md:h-16 md:w-16 bg-pink-500 rounded-full animate-ping"></div>
		</div>
	{/if}
</div>

<style>
	.blinking {
		animation: blinker 1s linear infinite;
	}
	@keyframes blinker {
		50% {
			opacity: 0;
		}
	}

	h1 {
		font-family: 'Grechen Fuemen', cursive;
	}
</style>
