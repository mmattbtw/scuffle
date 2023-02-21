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
					<br />
					A <span class="highlight">community driven streaming platform</span>, that is.
				</p>
			</div>
			<div class="section">
				<h2>For Fun&trade;</h2>
				<p>
					Have you ever thought of making your own streaming platform? No?
					<br />
					Well... We are making a streaming platform. An <span class="highlight">open-source</span>
					streaming platform.
					<br />
					You can join us on our journey of world conquer... It will be fun... Probably.
				</p>
			</div>
			<div class="section center">
				<h1>So... how do we conquer the world?</h1>
				<div class="bar-container">
					<div class="rust-bar flex-text">
						<p>90% Rust</p>
						<p class="magic-text">10% Magic</p>
					</div>
					<div class="magic-bar" />
				</div>
				<p>
					With the power of <span class="highlight">Rust</span>.. and
					<span class="highlight">Magic</span>, of course.
				</p>
			</div>
			<div class="section">
				<h2>Rust? Like the game?</h2>
				<p>
					No. Not the game, we’re talking ‘bout the programming language.
					<br />
					If you’re a programmer you must have heard of it before.
					<br />
					Fast and safe. That’s all you need to know about Rust.
					<br />
					Did we mention it’s fast? <span class="blazing-fast-text">Blazingly Fast&trade;.</span>
				</p>
			</div>
			<div class="section center">
				<h1>So... What makes it community driven?</h1>
				<p>
					Open source. Made by a community of people who actually care about their work.
					<br />
					We plan on having everything be as transparent as possible.
					<br />
					Transparent moderation, development.
					<br />
					That’s what it’s all about.
				</p>
			</div>
			<div class="section center">
				<h1>Aren’t streaming platforms super expensive?</h1>
				<p>
					Yes, they are...
					<br />
					Our biggest goal and challenge is making everything cost effective and self sustainable.
				</p>
			</div>
			<div class="section">
				<h2>Alright, you convinced me. Where can i join in on the fun?</h2>
				<p>You can join our Discord, and check out the source code on GitHub.</p>
			</div>
			<div class="buttons-container center bottom">
				<a href="https://github.com/scuffletv" target="_blank" rel="noopener noreferrer">
					<button class="github-button">GitHub</button>
				</a>
				<a href="https://discord.gg/CVyX3WerGr" target="_blank" rel="noopener noreferrer">
					<button class="discord-button">Discord</button>
				</a>
			</div>
		</div>
	</div>
</body>

<style lang="scss">
	.body {
		max-width: 45rem;
		margin: 0 auto;
	}

	button {
		border: none;
		border-radius: 0.5rem;
		padding: 1rem 3rem;
		font-size: 1.2rem;
		font-weight: 600;
		cursor: pointer;
		transition: background 0.2s ease-in-out;
	}

	.discord-button {
		background: #5865f2;
		color: white;
	}

	.discord-button:hover {
		background: #7289da;
	}

	.github-button {
		background: #292929;
		color: white;
	}

	.github-button:hover {
		background: #3f3f3f;
	}

	.buttons-container {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		gap: 0.5rem;
		margin-top: 2rem;
	}

	.bottom {
		margin-bottom: 25rem;
	}

	.flex-text {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: flex-start;
	}
	.flex-text > p {
		color: black;
	}

	.bar-container {
		margin-top: 1rem;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		width: 70%;
	}

	.magic-text {
		// move it to the right
		transform: translateX(2rem);
	}

	.rust-bar {
		width: 90%;
		height: 3rem;
		background: #dea584;
		border-radius: 0.5rem 0 0 0.5rem;
		text-align: left;
		padding-left: 1rem;
	}

	.magic-bar {
		width: 10%;
		height: 3rem;
		background: linear-gradient(to bottom right, #6fcbff, #fff, #ff72f9);
		border-radius: 0 0.5rem 0.5rem 0;
	}

	.section {
		margin-top: 7rem;
		display: flex;
		flex-direction: column;
		text-align: left;
		align-items: flex-start;
		justify-content: start;
	}
	.center {
		text-align: center;
		justify-content: center;
		align-items: center;
	}
	.highlight {
		color: white;
		font-weight: bold;
	}

	h1,
	h2 {
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

	.blazing-fast-text {
		font-weight: 800;
		color: #ffe145;
		background: linear-gradient(#ffe145, #ff0000);
		background-clip: text;
		-webkit-linear-gradient: (#ffe145, #ff0000);
		-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
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
		height: 100%;
		// background-image: linear-gradient(to bottom ,#0F1314, #0F1314);
		// background-repeat: no-repeat;
		// background-size: cover;
		// background-position: center;
		background-color: #0f1314;
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
