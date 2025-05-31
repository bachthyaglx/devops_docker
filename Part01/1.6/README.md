## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/in-depth-dive-into-images#a7ca8fd9-a7ac-4fe7-bfa1-e53898bab9f8)

> **EXERCISE 1.6: HELLO DOCKER HUB**
> 
> Run `docker run -it devopsdockeruh/pull_exercise`.
> 
> The command will wait for your input.
> 
> Navigate through the [Docker hub](https://hub.docker.com/) to find the docs and Dockerfile that was used to create the image.
> 
> Read the Dockerfile and/or docs to learn what input will get the application to answer a "secret message".
> 
> What is the secret message?

## Solution

```bash
$ docker run -it devopsdockeruh/pull_exercise
```
```bash
Unable to find image 'devopsdockeruh/pull_exercise:latest' locally
latest: Pulling from devopsdockeruh/pull_exercise
8e402f1a9c57: Pull complete
5e2195587d10: Pull complete
6f595b2fc66d: Pull complete
165f3baf4e94: Pull complete
67cf54fc424: Pull complete
Digest: sha256:7c063594049afb9ca0481fb6a58b16100f990a0d62c8665b9cfb5c9ada8a99f
Status: Downloaded newer image for devopsdockeruh/pull_exercise:latest
Give me the password: basics
You found the correct password. Secret message is:
"This is the secret message"
```
