<script lang="ts">
	import init, { add } from "player";
	import { onMount } from "svelte";

	onMount(async () => {
		await init();
		console.log(add(1, 2));
	});
</script>

<body class="h-screen bg-gradient-to-b from-black to-neutral-800 text-white bg-no-repeat">
	<div class="flex flex-col items-center">
		<div class="mt-64 flex flex-col justify-center">
			<div class="flex flex-col items-center">
				<h1 class="font-primary font-bold text-7xl text-transparent bg-clip-text bg-gradient-to-b from-[#FF7357] to-[#FF4C6D]">Scuffle.tv</h1>
				<p class="text-neutral-400">We’re building a streaming platform.</p>
				<p class="text-neutral-400">A <span class="text-white">community driven streaming platform</span>, that is.</p>
			</div>
		</div>
	</div>
</body>
