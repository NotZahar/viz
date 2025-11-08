#!/bin/zsh

set -eu

BUILD_DIR="/app/build/"

if [ -d "$BUILD_DIR" ]; then
	cd "$BUILD_DIR"
	./viz
else
	echo "No build found"
fi
