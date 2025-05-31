## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-4/optimizing-the-image-size#8747e05d-2d5d-4997-8e19-8e0e708925db)

> **EXERCISE 3.6: OPTIMIZED PROJECT IMAGES**
> 
> Return now back to our [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) Dockerfile.
> 
> Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both app frontend and backend, by joining the RUN commands and removing useless parts.
> 
> After your improvements document the image sizes again. Submit also your Dockerfiles as the answer.

## Solution

### Frontend Dockerfile optimized

    FROM node:16-alpine as builder
    WORKDIR /app
    COPY . .
    RUN npm install && npm run build
    FROM node:16-alpine
    RUN adduser -D bachthyaglx
    WORKDIR /app
    COPY --from=builder /app/build ./build
    RUN npm install -g serve
    USER bachthyaglx
    EXPOSE 5000
    CMD ["serve", "-s", "build", "-l", "5000"]

### Frontend Image Size Change

![Solution to Exercise 3.6](https://raw.githubusercontent.com/VikSil/DevOps_with_Docker/refs/heads/trunk/Part3/Exercise_3.6/frontend_change.png)

### Backend Dockerfile optimized

    FROM golang:1.16-alpine
    RUN adduser -D -g '' bachthyaglx && mkdir -p /usr/src/app && chown -R bachthyaglx /usr/src/app
    USER bachthyaglx
    WORKDIR /usr/src/app
    COPY . .
    RUN go build
    EXPOSE 8080
    CMD ["./server"]
    
### Backend Image Size Change

![Solution to Exercise 3.6](https://raw.githubusercontent.com/VikSil/DevOps_with_Docker/refs/heads/trunk/Part3/Exercise_3.6/backend_change.png)
