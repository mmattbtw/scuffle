<script lang="ts">
	import init, { add } from "player";
	import { onMount } from "svelte";

	onMount(async () => {
		await init();
		console.log(add(1, 2));
	});
</script>

<body>
	<div class="body container">
		<div class="top-margin">
			<div class="container header">
				<h1 class="wordmark">Scuffle.tv</h1>
				<p class="heading-description">
					We’re building a streaming platform. 
					<br/>
					A <span class="highlight">community driven streaming platform</span>, that is.
				</p>
			</div>
			<div class="section">
				<h2>For Fun&trade;</h2>
				<p>
					Have you ever thought of making your own streaming platform? No?
					<br/>
					Well... We are making a streaming platform. An open-source streaming platform.
					<br/>
					You can join us on our journey of world conquer... It will be fun... Probably.
				</p>
			</div>
		</div>
	</div>
</body>

<style lang="scss">
	.body {
		max-width: 40rem;
		margin: 0 auto;
	}

	.section {
		margin-top: 2rem;
		display: flex;
		flex-direction: column;
		text-align: left;
		align-items: flex-start;
		justify-content: start;
	}

	.highlight {
		color: white;
		font-weight: bold;
	}

	h1,h2  {
		// get rid of the default margin
		margin: 0;
	}

	.heading-description {
		text-align: center;
		margin-top: -0.1rem;
	}
	
	p {
		color: rgb(163, 163, 163);
		font-weight: 100;
	}
	
	.wordmark {
		font-family: "Comfortaa", sans-serif;
		font-weight: 700;
		font-size: 5rem;
		color: #ff7357;
		background: linear-gradient(#ff7357, #ff4c6d);
		background-clip: text;
		-webkit-linear-gradient: (#ff7357, #ff4c6d);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	body {
		height: 100vh;
		// background-image: linear-gradient(to bottom, #000000, #1a1a1a);
		background-image: linear-gradient(to bottom ,#0F1314, #0F1314);
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
		color: white;
		font-family: "Be Vietnam Pro", sans-serif;
	}
	
	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.top-margin {
		margin-top: 10rem;
	}
</style>