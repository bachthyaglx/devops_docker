## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-4/optimizing-the-image-size#bb0f2fd6-df4a-4887-87c0-9fc97df08a23)

> **EXERCISE 3.10: OPTIMAL SIZED IMAGE**
> 
> Do all or most of the optimizations from security to size for **one** other Dockerfile you have access to, in your own project or for example the ones used in previous "standalone" exercises.
> 
> As answer to the exercise, give the Dockerfile before and after the changes.

## Solution

### Dockerfile before

    FROM node:16
    WORKDIR /usr/src/app
    COPY . .
    RUN npm install
    RUN npm run build
    RUN npm install -g serve
    EXPOSE 5000
    CMD ["serve", "-s", "build", "-l", "5000"]

### Dockerfile after

    FROM node:16-alpine as builder
    WORKDIR /app
    COPY . .
    RUN npm install && npm run build
    FROM node:16-alpine
    RUN adduser -D bachthyaglx # Add non-root user
    WORKDIR /app
    # Copy only built static assets
    COPY --from=builder /app/build ./build
    RUN npm install -g serve
    USER frontend
    EXPOSE 5000
    CMD ["serve", "-s", "build", "-l", "5000"]

### Image Size Change

![Solution to Exercise 3.10](https://raw.githubusercontent.com/VikSil/DevOps_with_Docker/refs/heads/trunk/Part3/Exercise_3.10/Dockerfile_size_change.png)
