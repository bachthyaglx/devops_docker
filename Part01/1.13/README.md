## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#d4c1e0bc-4796-4f0b-9eaa-c58084afb94f)

> **EXERCISE 1.13: HELLO, BACKEND!**
> 
> Clone, fork or download a project from https://github.com/docker-hy/material-applications/tree/main/example-backend.
> 
> Create a Dockerfile for the project (example-backend). Start the container with port 8080 published.
> 
> When you start the container and navigate to http://localhost:8080/ping you should get a "pong" as a response.
> 
> *Do not alter the code of the project*
> 
> TIPS:
> 
> - you might need [this](https://docs.docker.com/reference/dockerfile/#env)
> - If you have M1/M2 Mac, you might need to build the image with an extra option `docker build --platform linux/amd64 -t imagename .`
>
> Submit the Dockerfile and the commands used as the answer.

## Solution

### Dockerfile

    FROM golang:1.20 AS builder
    WORKDIR /app
    COPY go.mod go.sum ./
    RUN go mod download
    COPY . .
    RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o backend
    FROM alpine:latest
    RUN apk --no-cache add ca-certificates
    WORKDIR /root/
    COPY --from=builder /app/backend .
    EXPOSE 8080
    CMD ["./backend"]

### Commands

    docker build -t example-backend .
    docker run -d -p 8080:8080 example-backend
