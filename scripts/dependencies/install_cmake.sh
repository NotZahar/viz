#!/bin/zsh

set -eu

TMP_DIRECTORY="../../tmp"
INSTALL_DIRECTORY="/opt/dependencies/cmake"
CMAKE_VERSION="4.1.2"

mkdir -p $TMP_DIRECTORY
cd $TMP_DIRECTORY

wget "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.tar.gz"
tar zvxf "cmake-$CMAKE_VERSION.tar.gz"

cd "cmake-$CMAKE_VERSION"
./bootstrap --prefix="$INSTALL_DIRECTORY"
make -j$(nproc)
make -j$(nproc) install

cd ..
rm -rf cmake*
