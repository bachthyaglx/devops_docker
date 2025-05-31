## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-4/optimizing-the-image-size#40aab5a1-f4e2-4f89-aed8-7c5efdc489ff)

> **EXERCISE 3.7: PROJECT WITH PREINSTALLED ENVIRONMENTS**
> 
> As you may have guessed, you shall now return to the frontend and backend from the previous exercise.
> 
> Change the base image in FROM to something more suitable. To avoid the extra hassle, it is a good idea to use a pre-installed image for both [Node.js](https://hub.docker.com/_/node) and [Golang](https://hub.docker.com/_/golang). Both should have at least Alpine variants ready in DockerHub.
> 
> Note that the frontend requires Node.js version 16 to work, so you must search for a bit older image.
> 
> Make sure the application still works after the changes.
> 
> Document the size before and after your changes.

## Solution

| Service  | Before Optimization | After Alpine Preinstalled | Savings |
| -------- | ------------------- | ------------------------- | ------- |
| Backend  | ~312MB              |  ~280MB                   | ~32MB  |
| Frontend | ~1.1GB              |  ~140MB (multi-stage)     | ~960MB |
