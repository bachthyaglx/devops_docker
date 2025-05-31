## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-3/volumes-in-action#0117ad93-2b94-48c6-a399-120188ef9019)

> **EXERCISE 2.10: CLOSE THE PORTS**
> 
> Now we have the reverse proxy up and running! All the communication to our app should be done through the reverse proxy and direct access (eg. accessing the backend with a GET to http://localhost:8080/ping) should be prevented.
> 
> Use a port scanner, eg https://hub.docker.com/r/networkstatic/nmap to ensure that there are no extra ports open in the host.
> 
> It might be enough to just run
> 
>     $ docker run -it --rm --network host networkstatic/nmap localhost
> 
> If you have an M1/M2 Mac, you might need to build the image yourself.
> 
> The result looks like the following (I used a self-built image):
> 
>     $ docker run -it --rm --network host nmap localhost
>     Starting Nmap 7.93 ( https://nmap.org ) at 2023-03-05 12:28 UTC
>     Nmap scan report for localhost (127.0.0.1)
>     Host is up (0.0000040s latency).
>     Other addresses for localhost (not scanned): ::1
>     Not shown: 996 closed tcp ports (reset)
>     PORT     STATE    SERVICE
>     80/tcp   filtered http
>     111/tcp  open     rpcbind
>     5000/tcp filtered commplex-link
>     8080/tcp filtered http-proxy
> 
>     Nmap done: 1 IP address (1 host up) scanned in 1.28 seconds
> 
> As we see, there are two suspicious open ports: 5000 and 8080. So it is obvious that the frontend and backend are still directly accessible in the host network. This should be fixed!
> 
> You are done when the port scan report looks something like this:
> 
>     Starting Nmap 7.93 ( https://nmap.org ) at 2023-03-05 12:39 UTC
>     Nmap scan report for localhost (127.0.0.1)
>     Host is up (0.0000040s latency).
>     Other addresses for localhost (not scanned): ::1
>     Not shown: 998 closed tcp ports (reset)
>     PORT    STATE    SERVICE
>     80/tcp  filtered http
>     111/tcp open     rpcbind
> 
>     Nmap done: 1 IP address (1 host up) scanned in 1.28 seconds
>
> As the answer, submit the version of docker-compose.yml that does not expose any ports.

## Solution

### Docker Compose File

    version: "3"

    services:
      frontend:
        build:
          context: ./example-frontend
          args:
            REACT_APP_BACKEND_URL: /api
        depends_on:
          - backend
    
      backend:
        build:
          context: ./example-backend
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
    
      redis:
        image: redis:7
        restart: always
    
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
