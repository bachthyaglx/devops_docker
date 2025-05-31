## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-3/volumes-in-action#365c096b-aa4a-4d31-bb86-a63479c1ad78)

> **EXERCISE 2.9: FIXUP**
> 
> Most of the buttons may have stopped working in the example application. Make sure that every button for exercises works.
> 
> Remember to take a peek into the browser's developer consoles again like we did back [chapter 2](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry), remember also [this](https://github.com/docker-hy/material-applications/tree/main/example-frontend#exercise-114---to-connect-to-backend) and [this](https://github.com/docker-hy/material-applications/tree/main/example-backend).
> 
> The buttons of the Nginx exercise and the first button behave differently but you want them to match.
> 
> As answer submit the changes you made.

## Solution

### Docker Compose File

    version: "3"

    services:
      frontend:
        build:
          context: ./example-frontend
          args:
            REACT_APP_BACKEND_URL: /api  # updated to point through NGINX
        ports:
          - "5000:5000"
        depends_on:
          - backend
    
      backend:
        build:
          context: ./example-backend
        ports:
          - "8080:8080"
        depends_on:
          - postgres
          - redis
        environment:
          - POSTGRES_HOST=postgres
          - POSTGRES_USER=postgres
          - POSTGRES_PASSWORD=example
          - POSTGRES_DB=appdb
          - REDIS_HOST=redis
          - REDIS_PORT=6379
    
      postgres:
        image: postgres:14
        restart: always
        environment:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: example
          POSTGRES_DB: appdb
        volumes:
          - postgres_data:/var/lib/postgresql/data
        ports:
          - "5432:5432"
    
      redis:
        image: redis:7
        restart: always
        ports:
          - "6379:6379"
    
      nginx:
        image: nginx:alpine
        ports:
          - "80:80"
        volumes:
          - ./nginx.conf:/etc/nginx/nginx.conf:ro
        depends_on:
          - frontend
          - backend
    
    volumes:
      postgres_data:

### Frontend Dockerfile

    FROM node:16

    WORKDIR /usr/src/app
    
    COPY . .
    
    # Set backend API to go through NGINX proxy
    ARG REACT_APP_BACKEND_URL=/api
    ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL
    
    RUN npm install
    RUN npm install -g serve
    RUN npm run build
    
    EXPOSE 5000
    
    CMD ["serve", "-s", "-l", "5000", "build"]

### Backend Dockerfile

    FROM golang:1.16
    
    WORKDIR /usr/src/app
    
    COPY . .
    
    ENV PORT=8080
    ENV REQUEST_ORIGIN=http://localhost:5000
    
    RUN go build
    
    EXPOSE 8080
    
    CMD ["./server"]
