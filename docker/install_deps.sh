#!/bin/bash

set -eu

DEPS=(
	"locales"
	"zsh"
	"vim"
	"curl"
	"git"
	"shfmt"
	"wget"
	"python3"
	"python3-pip"
	"python3-venv"
	"pipx"
	"libfontconfig1-dev"
	"libfreetype6-dev"
	"libx11-dev"
	"libxext-dev"
	"libxfixes-dev"
	"libxi-dev"
	"libxrender-dev"
	"libxcb1-dev"
	"libx11-xcb-dev"
	"libxcb-glx0-dev"
	"libxcb-keysyms1-dev"
	"libxcb-image0-dev"
	"libxcb-shm0-dev"
	"libxcb-icccm4-dev"
	"libxcb-sync0-dev"
	"libxcb-xfixes0-dev"
	"libxcb-shape0-dev"
	"libxcb-randr0-dev"
	"libxcb-render-util0-dev"
	"libxkbcommon-dev"
	"libxss1"
	"libasound2-dev"
	"libfontconfig1-dev"
	"libfreetype6-dev"
	"libgl1-mesa-dev"
	"libegl1-mesa-dev"
	"libvulkan-dev"
	"vulkan-tools"
	"vulkan-utility-libraries-dev"
	"spirv-tools"
)

apt update
for package in "${DEPS[@]}"; do
	apt install -y "$package"
done

rm -rf /var/lib/apt/lists/*
