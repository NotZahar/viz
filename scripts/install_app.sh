#!/bin/zsh

set -eu

BUILD_DIRECTORY="/app/build/"
INSTALL_DIRECTORY="/app/install/"

cmake --install "${BUILD_DIRECTORY}" --prefix "${INSTALL_DIRECTORY}"
