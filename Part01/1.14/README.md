## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#9227044c-5b55-4b89-b568-fc5071166025)

> **EXERCISE 1.14: ENVIRONMENT**
> 
> Start both the frontend and the backend with the correct ports exposed and add [ENV](https://docs.docker.com/reference/dockerfile/#env) to Dockerfile with the necessary information from both READMEs ([front](https://github.com/docker-hy/material-applications/tree/main/example-frontend[), [back](https://github.com/docker-hy/material-applications/tree/main/example-backend)).
> 
> Ignore the backend configurations until the frontend sends requests to `_backend_url_/ping` when you press the button.
> 
> **You know that the configuration is ready when the button for 1.14 of frontend responds and turns green.**
> 
> *Do not alter the code of either project*
> 
> To get the configurations right, it is important to understand the interplay of browser and the app.
>
>  - at first the browser gets HTML file and the JavaScript from the frontend container
>  - browser executes the JavaScript code, that renders the App and sets ut the button listeners etc
>  - once the button for Exercise 1.14 is pressed, frontend does a request to to backend container
>
> ![how browser accesses the frontend and backend](https://courses.mooc.fi/api/v0/files/course/03317330-6e94-44b0-a138-603dd2a54c0b/images/fdS4XBesHHBm1EzROIXsR17hVC1nzk.png)
> 
> So the key thing is that the frontend code is executed by the browser, the frontend container does not run any code, it just serves the HTML and the JavaScript code for the browser!
>
> The following figure might help you with setting up the port mappings:
>
> ![how browser accesses the frontend and backend](https://courses.mooc.fi/api/v0/files/course/03317330-6e94-44b0-a138-603dd2a54c0b/images/fdS4XBesHHBm1EzROIXsR17hVC1nzk.png)
>
> The frontend will first talk to your browser. Then the code will be executed from your browser and that will send a message to the backend.
> 
> ![More information about connection between frontend and backend](https://courses.mooc.fi/api/v0/files/course/03317330-6e94-44b0-a138-603dd2a54c0b/images/8xZVzdvu2RHgjnV0UprCcqBa0Q1Ys0.png)
> 
> TIPS:
> 
> - When configuring web applications keep the browser developer console ALWAYS open, F12 or cmd+shift+I when the browser window is open. Information about configuring cross-origin requests is in the README of the backend project.
> - The developer console has multiple views, the most important ones are Console and Network. Exploring the Network tab can give you a lot of information on where messages are being sent and what is received as a response!
>
> **Submit the edited Dockerfiles and commands used to run.**

## Solution

### Frontend Dockerfile 

    FROM node:16
    WORKDIR /usr/src/app
    COPY package*.json ./
    RUN npm install
    COPY . .
    ENV REACT_APP_BACKEND_URL=http://localhost:8080
    RUN npm run build
    RUN npm install -g serve
    EXPOSE 5000
    CMD ["serve", "-s", "-l", "5000", "build"]

### Backend Dockerfile 

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
    ENV REQUEST_ORIGIN=http://localhost:5000
    CMD ["./backend"]

### Commands

    docker build -t example-frontend .
    docker build -t example-backend .
    docker run -d -p 5001:5000 example-frontend
    docker run -d -p 8080:8080 example-backend
