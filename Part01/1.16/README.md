## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#3a23e02b-eebf-4fbf-aaf7-623c16722e27)

> **EXERCISE 1.16: HOMEWORK**
> 
> It is time to wrap up this part and run a containerized app in the cloud.

> You can take any web-app, eg. an example or exercise from this part or your own app, and deploy it to some cloud provider.

> There are plenty of alternatives, and most provide a free tier. Here are some alternatives that are quite simple to use:

> render.com(opens in a new tab) (bad documentation, you most likely need google)
> heroku.com(opens in a new tab) (has a free student plan through GitHub Student Developer Pack(opens in a new tab))
> fly.io(opens in a new tab) (easy to use but unfortunately has no more a free tier)
> If you know a good cloud service for the purposes of this exercise, please tell us (yes, we know about Amazon AWS, Google Cloud and Azure already... ).

> Submit the Dockerfile, a brief description of what you did, and a link to the running app.

## Solution

# Dockerfile #
```bash
ARG NODE_VERSION=16.20.2
FROM node:${NODE_VERSION}-slim AS base
LABEL fly_launch_runtime="Node.js"
WORKDIR /app
ENV NODE_ENV="production"
FROM base AS build
RUN apt-get update -qq && apt-get install --no-install-recommends -y build-essential node-gyp pkg-config python
COPY package-lock.json package.json ./
RUN npm ci --include=dev
COPY . .
RUN npm run build
RUN npm prune --omit=dev
FROM base
COPY --from=build /app /app
EXPOSE 3000
CMD [ "npm", "run", "start" ]
```

# Description #
This Docker image contains production-ready of Node.js application. The image uses stages to optimize performance and size and dependencies are installed. The app is deployed on Fly.io

# Link #
https://full-stack-open-pokedex-still-frog-2152.fly.dev/
