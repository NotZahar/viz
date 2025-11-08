#!/bin/bash

set -eu

CONTAINER_NAME="viz-dev-container"
IMAGE_NAME="viz-dev"

already_in_container() {
	if [ -f /.dockerenv ]; then
		return 0
	fi

	return 1
}

is_container_running() {
	docker ps --filter "name=$CONTAINER_NAME" --filter "status=running" | grep $CONTAINER_NAME >/dev/null

	return $?
}

if already_in_container; then
	echo "Already in container"
else
	if is_container_running; then
		docker exec -it $CONTAINER_NAME /bin/zsh
	else
		docker compose up -d $IMAGE_NAME
		docker exec -it $CONTAINER_NAME /bin/zsh
	fi
fi
