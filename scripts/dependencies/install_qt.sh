#!/bin/zsh

set -eu

TMP_DIRECTORY="/app/tmp"
BUILD_DIRECTORY="$TMP_DIRECTORY/qt_build"
INSTALL_DIRECTORY="/opt/dependencies/qt"
QT_VERSION_MAJOR="6"
QT_VERSION_MINOR="8"
QT_VERSION_PATCH="1"

mkdir -p $TMP_DIRECTORY
cd $TMP_DIRECTORY

wget "https://download.qt.io/official_releases/qt/$QT_VERSION_MAJOR.$QT_VERSION_MINOR/$QT_VERSION_MAJOR.$QT_VERSION_MINOR.$QT_VERSION_PATCH/single/qt-everywhere-src-$QT_VERSION_MAJOR.$QT_VERSION_MINOR.$QT_VERSION_PATCH.tar.xz"
tar vxf "qt-everywhere-src-$QT_VERSION_MAJOR.$QT_VERSION_MINOR.$QT_VERSION_PATCH.tar.xz"

mkdir -p $BUILD_DIRECTORY
cd $BUILD_DIRECTORY
../qt-everywhere-src-$QT_VERSION_MAJOR.$QT_VERSION_MINOR.$QT_VERSION_PATCH/configure -prefix $INSTALL_DIRECTORY -feature-vulkan -skip qtwebengine -skip qtquick3d -skip qtquick3dphysics -skip qtgraphs -- -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -G Ninja
cmake --build . --parallel
cmake --install .

cd $TMP_DIRECTORY
rm -rf qt*
