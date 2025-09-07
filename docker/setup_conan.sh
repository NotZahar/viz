#!/bin/bash

set -eu

pipx install conan
export PATH="/root/.local/bin:$PATH"
echo 'export PATH="/root/.local/bin:$PATH"' >>/root/.bashrc

conan profile detect --force
