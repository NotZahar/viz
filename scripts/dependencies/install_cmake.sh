#!/bin/zsh

set -eu

TMP_DIRECTORY="/app/tmp"
BUILD_DIRECTORY="$TMP_DIRECTORY/cmake-$CMAKE_VERSION"
INSTALL_DIRECTORY="/opt/dependencies/cmake"
CMAKE_VERSION="4.1.2"

mkdir -p $TMP_DIRECTORY
cd $TMP_DIRECTORY

wget "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.tar.gz"
tar zvxf "cmake-$CMAKE_VERSION.tar.gz"

cd $BUILD_DIRECTORY
./bootstrap --prefix="$INSTALL_DIRECTORY"
make -j$(nproc)
make -j$(nproc) install

cd $TMP_DIRECTORY
rm -rf cmake*
