#!/bin/sh

set -e

if [ "$#" -ne 2 ]; then
  echo "Usage: builder.sh <github_user/repo> <dockerhub_user/repo>"
  echo "Example: ./builder.sh bachthyaglx/devops_docker/tree/main/Part03/3.2/full-stack-open-pokedex bachthyaglx/hu-docker-part3-ex3.1"
  exit 1
fi

if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PWD" ]; then
  echo "Environment variables DOCKER_USER and DOCKER_PWD must be set."
  exit 1
fi

# Clone the repo
git clone "https://github.com/$1"
IFS=/ read -r _ repo <<< "$1"
cd "$repo"

# Build image
docker build -t "$repo" .

# Login to Docker Hub
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin

# Tag and push
docker tag "$repo" "$2"
docker push "$2"

echo "Image pushed: $2"
