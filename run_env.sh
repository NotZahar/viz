#!/bin/bash

CONTAINER_NAME="viz-dev-container"
IMAGE_NAME="viz-dev"

already_in_container() {
	if [ -f /.dockerenv ]; then
		return 0
	fi

	return 1
}

if already_in_container; then
	echo "Already in container"
else
	docker compose up -d "$IMAGE_NAME"
	docker exec -it "$CONTAINER_NAME" /bin/zsh
fi
