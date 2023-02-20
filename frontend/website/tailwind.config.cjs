/** @type {import('tailwindcss').Config} */
module.exports = {
	content: ["./src/**/*.{html,js,svelte,ts}"],
	theme: {
		extend: {
			colors: {
				// todo: name these better
				primary: "#FF7357",
				darkbg: "#16282C",
				lighterbg: "#223134",
			},
			fontFamily: {
				primary: ["Comfortaa", "sans-serif"],
				sans: ["Be Vietnam Pro", "sans-serif"],
			},
		},
	},
	plugins: [],
};
