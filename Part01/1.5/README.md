## [Assignment](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/in-depth-dive-into-images#c0ac55c7-47dc-4e80-8021-e39440b33b91)

> **EXERCISE 1.5: SIZES OF IMAGES**
> 
> In the [Exercise 1.3](https://courses.mooc.fi/org/uh-cs/courses/devops-with-docker/chapter-2/running-and-stopping-containers#4b132769-24bb-4523-b620-1f355fb69a18) we used `devopsdockeruh/simple-web-service:ubuntu.`
> 
> Here is the same application but instead of Ubuntu is using [Alpine Linux](https://www.alpinelinux.org/): `devopsdockeruh/simple-web-service:alpine`.
> 
> Pull both images and compare the image sizes.
> 
> Go inside the Alpine container and make sure the secret message functionality is the same. Alpine version doesn't have `bash` but it has `sh`, a more bare-bones shell.
>
> What is the size of the alpine image (in MB)?
>
> What is the size of the ubuntu image (in MB)?


## Solution

```bash
docker images
```
| REPOSITORY                         | TAG     | IMAGE ID     | CREATED     | SIZE    |
|------------------------------------|---------|--------------|-------------|---------|
| devopsdockeruh/simple-web-service  | ubuntu  | d44e1dce3987 | 4 years ago | 126MB   |
| devopsdockeruh/simple-web-service  | alpine  | dd4d367476f8 | 4 years ago | 24.3MB  |

