## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-3/docker-networking#c3918908-8f8e-4210-ac23-495374347ae4)

> **EXERCISE 2.5: SCALE**
> 
> The project https://github.com/docker-hy/material-applications/tree/main/scaling-exercise is a barely working application. Go ahead and clone it for yourself. The project already includes docker-compose.yml so you can start it by running `docker compose up`.
> 
> The application should be accessible through http://localhost:3000. However it doesn't work well enough and we've added a load balancer for scaling. Your task is to scale the `compute` containers so that the button in the application turns green.
> 
> This exercise was created with [Sasu Mäkinen](https://github.com/sasumaki)
> 
> Submit the used commands for the answer.

## Solution
    
    git clone https://github.com/docker-hy/material-applications.git
    cd material-applications/scaling-exercise
    docker compose up --scale compute=5 --build
