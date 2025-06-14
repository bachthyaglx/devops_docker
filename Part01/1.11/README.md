## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/utilizing-tools-from-the-registry#f9b9fd5f-6eb3-41cc-b30a-d2375530f404)

> **EXERCISE 1.11: SPRING**
> 
> Create a Dockerfile for an old Java Spring project that can be found from the [course repository](https://github.com/docker-hy/material-applications/tree/main/spring-example-project).
> 
> The setup should be straightforward with the README instructions. Tips to get you started:
> 
> There are many options for running Java, you may use eg. [amazoncorretto](https://hub.docker.com/_/amazoncorretto) `FROM amazoncorretto:_tag_` to get Java instead of installing it manually. Pick the tag by using the README and Docker Hub page.
> 
> You've completed the exercise when you see a 'Success' message in your browser.
> 
> Submit the Dockerfile and the command you used to run the container.

## Solution

  ### Dockerfile
  
    FROM amazoncorretto:8
    WORKDIR /usr/src/app
    COPY target/*.jar app.jar
    EXPOSE 8080
    CMD ["java", "-jar", "app.jar"]
    
  ### Commands
  
    mvn clean package
    docker build -t spring-success-app .
    docker run -d -p 8080:8080 spring-success-app
