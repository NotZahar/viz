#!/bin/zsh

set -eu

BUILD_DIR="/app/build/"
INSTALL_DIR="/app/install/"

cmake --install "${BUILD_DIR}" --prefix "${INSTALL_DIR}"
