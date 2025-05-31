## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-4/optimizing-the-image-size#db2075da-4f40-41f5-85a4-96027b561219)

> **EXERCISE 3.9: MULTI-STAGE BACKEND**
> 
> Let us do a multi-stage build for the [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) project since we've come so far with the application.
> 
> The project is in Golang and building a binary that runs in a container, while straightforward, isn't exactly trivial. Use resources that you have available (Google, example projects) to build the binary and run it inside a container that uses `FROM scratch`.
> 
> To successfully complete the exercise the image must be smaller than **35MB**.
>
> Submit your Dockerfile as the answer.

## Solution

### Dockerfile

    FROM golang:1.16-alpine AS builder
    RUN adduser -D builderuser # Add non-root user (optional, for build phase only)
    WORKDIR /app
    COPY . .
    RUN CGO_ENABLED=0 GOOS=linux go build -o server # Build the statically linked binary
    FROM scratch
    COPY --from=builder /app/server /server
    USER 1000 # Use non-root user (recommended for scratch images)
    ENTRYPOINT ["/server"]
