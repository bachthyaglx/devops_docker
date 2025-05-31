#!/bin/bash

# Exit on any error
set -e

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github_user/repo> <dockerhub_user/repo>"
  echo "Example: ./builder.sh bachthyaglx/devops_docker/tree/main/Part03/3.2/full-stack-open-pokedex bachthyaglx/hu-docker-part3-ex3.1"
  exit 1
fi

# Clone the GitHub repo
git clone "https://github.com/$1"

# Extract repo name
IFS=/ read -r github_user repo <<< "$1"

cd "$repo"

# Build Docker image
docker build -t "$repo" .

# Tag and push
docker login
docker tag "$repo" "$2"
docker push "$2"

echo "Done: $2 pushed to Docker Hub!"
