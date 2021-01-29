module.exports = {
	// public path from the root of your website domain to the root of this app
	publicPath: process.env.NODE_ENV === "production" ? "/vue-todo-pug/" : "/",
	// npm run build output directory
	outputDir: "docs",
};
