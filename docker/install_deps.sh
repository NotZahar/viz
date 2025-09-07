#!/bin/bash

set -eu

apt update

apt install -y locales
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

apt install -y \
    zsh \
    vim \
    curl \
    git \
    shfmt \
    wget

apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    pipx

rm -rf /var/lib/apt/lists/*

pipx install conan
export PATH="/root/.local/bin:$PATH"
echo 'export PATH="/root/.local/bin:$PATH"' >> /root/.bashrc

RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) || true
