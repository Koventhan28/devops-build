#!/bin/bash
set -e 
#Variable for the docker container 
IMAGE_NAME=ecommerce
TAG=$RANDOM
DOCKER_USER="koventhan"
REPO="${DOCKER_USER}/${IMAGE_NAME}"
# for building the docker images move the appropriate directory and the docker build commands
#cd /home/koventhan/Desktop/devops-build
# Using the docker build command for running the image
docker build -t $IMAGE_NAME:$TAG . 
# Taggging build image to the latest image 
docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:latest
docker tag $IMAGE_NAME:$TAG $REPO:latest
docker push $REPO:latest
echo "Successfully pushed $REPO:latest and $REPO:$TAG"
