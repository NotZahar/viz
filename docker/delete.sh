#!/bin/bash

CONTAINER_NAME="viz-dev-container"
IMAGE_NAME="viz-dev"
VOLUME_NAME="viz-dependencies"

docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"
docker rmi "$IMAGE_NAME"
docker volume rm "$VOLUME_NAME"
