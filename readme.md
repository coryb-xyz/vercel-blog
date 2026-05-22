# MVP Vercel NextJS Blog Starter

Basic dockerfile and helm chart, as well as build and publish pipelines, to get the [Vercel Blog Starter App](https://github.com/vercel/next.js/tree/canary/examples/blog-starter) into a releasable state.  

Note: normally the `next.config.js` file would be bundled with the app source, but that is a project I don't control so I'm including it here and copying it in the container build step. 
