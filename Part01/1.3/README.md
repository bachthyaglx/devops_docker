## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/running-and-stopping-containers#4b132769-24bb-4523-b620-1f355fb69a18)

> **EXERCISE 1.3: SECRET MESSAGE**
> 
> Now that we've warmed up it's time to get inside a container while it's running!
> 
> Image `devopsdockeruh/simple-web-service:ubuntu` will start a container that outputs logs into a file. Go inside the running container and use `tail -f ./text.log` to follow the logs. Every 10 seconds the clock will send you a "secret message".
> 
> What are the commands to see the secret message?
>
> What is the secret message?


## Solution
```bash
docker run -d --name simple-service devopsdockeruh/simple-web-service:ubuntu
docker exec -it simple-service bash
tail -f ./text.log
```
