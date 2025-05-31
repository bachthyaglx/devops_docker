## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/definitions-and-basic-concepts#e61047a7-6306-4222-80c3-3b89c7b995ce)

> **EXERCISE 1.1: GETTING STARTED**
> 
> Since we already did "Hello, World!" in the material let's do something else.
> 
> Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.
> 
> Stop two of the containers and leave one container running.
> 
> As an answer write the output for `docker ps -a` which shows 2 stopped containers and one running.

## Solution
```bash
docker ps -a
```
> CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                      PORTS                NAMES
> a1b2c3d4e5f6   nginx     "/docker-entrypoint.…"   30 seconds ago   Up 29 seconds               80/tcp               nginx1
> b2c3d4e5f6g7   nginx     "/docker-entrypoint.…"   30 seconds ago   Exited (0) 10 seconds ago                        nginx2
> c3d4e5f6g7h8   nginx     "/docker-entrypoint.…"   30 seconds ago   Exited (0) 8 seconds ago                         nginx3
