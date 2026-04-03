#!/bin/bash
set -e 
DOCKER_USER="koventhan"
PORT=80
IMAGE_NAME=ecommerce
REPO=${DOCKER_USER}/${IMAGE_NAME}

#Pulling the image from the repository
docker pull $REPO:latest
# running the container in background
docker run -p 80:$PORT -d $REPO:latest

