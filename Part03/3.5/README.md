## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-4/using-a-non-root-user#c6dbbffe-6a04-41ea-bc80-48076cf7836f)

> **EXERCISE 3.5: OPTIMIZED PROJECT**
> 
> In exercises [1.12](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#0679c676-3257-4c41-86e1-aa0db93b6977) and [1.13](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#d4c1e0bc-4796-4f0b-9eaa-c58084afb94f) we created Dockerfiles for both [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend).
> 
> Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the Internet.
> 
> Make sure the containers start their processes as non-root user.
> 
> The backend image is based on [Alpine Linux](https://www.alpinelinux.org/), which does not support the command `useradd`. Google will surely help you a way to create a user in an `alpine` based image.
> 
> Submit the Dockerfiles as a.

## Solution

### Frontend Dockerfile

    FROM node:16
    WORKDIR /usr/src/app
    COPY . .
    RUN useradd -m bachthyaglx # Create a non-root user
    RUN npm install
    RUN npm install -g serve
    RUN npm run build
    USER bachthyaglx # Use non-root user
    EXPOSE 5000
    CMD ["serve", "-s", "-l", "5000", "build"]

### Backend Dockerfile

    FROM golang:1.16-alpine
    RUN adduser -D -g '' bachthyaglx # Create a non-root user
    WORKDIR /usr/src/app
    COPY . .
    RUN go build
    RUN chown -R bachthyaglx /usr/src/app # Change ownership and switch user
    USER bachthyaglx
    EXPOSE 8080
    CMD ["./server"]
