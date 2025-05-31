## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/interacting-with-the-container-via-volumes-and-ports#ddf44c72-27d6-4459-8bb4-b72fe5d104e5)

> **EXERCISE 1.9: VOLUMES**
> 
> Image `devopsdockeruh/simple-web-service` creates a timestamp every two seconds to `/usr/src/app/text.log` when it's not given a command. Start the container with a bind mount so that the logs are created into your filesystem.
> 
> **Hint**: read the note that was made just before this exercise!
>
> As the answer submit the command you used to complete the exercise.

## Solution

```bash
docker run -d --name log-mount \
  -v "$(pwd)/logs/text.log:/usr/src/app/text.log" \
  devopsdockeruh/simple-web-service
```
```bash
cat ./logs/text.log
```
