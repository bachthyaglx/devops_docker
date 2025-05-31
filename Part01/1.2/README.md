## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/definitions-and-basic-concepts#69973c71-ef3e-444b-8944-5f427ef0cffb)

> **EXERCISE 1.2: CLEANUP**
>
> Stop all your containers. 
>
> now you have containers and some images that are no longer in use and are taking up space. Running `docker ps -a` and `docker image ls` will confirm this.
> 
> Clean the Docker daemon by removing all images and containers.
> 
> As an answer give the output for `docker ps -a` and `docker image ls`

## Solution

```bash
docker ps -a
```
CONTAINER ID  | IMAGE |  COMMAND |   CREATED |  STATUS |   PORTS |    NAMES
```bash
docker image ls
```
REPOSITORY | TAG | IMAGE ID |  CREATED |  SIZE
