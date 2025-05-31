## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-3/containers-in-development#86174c31-e0ac-44c5-b03f-338267034c4e)

> **EXERCISE 2.11: Your dev env**
>
> Select some of your own development projects and start utilizing containers in the development environment.

> Explain what you have done. It can be anything, e.g., support for docker-compose.yml to have services (such as databases) containerized or even a fully blown containerized development environment.

## Solution

    I selected a fullstack Next.js + Node.js for building my portfolio. Hence, I added a docker-compose.yml file to fully containerize the frontend, backend, database (PostgreSQL), and Redis cache. 
    I also included NGINX as a reverse proxy. Only port 80 is exposed to the host. This made the dev environment easy to start and replicate using docker-compose up, with no manual setup needed outside the containers.
