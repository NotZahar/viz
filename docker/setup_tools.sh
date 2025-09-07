#!/bin/bash

set -eu

conan profile detect --force

cat >>/root/.zshrc <<'EOF'

export PATH="/opt/deps/gcc/bin:/opt/deps/cmake/bin:$PATH"
export CC="/opt/deps/gcc/bin/gcc"
export CXX="/opt/deps/gcc/bin/g++"
export LD_LIBRARY_PATH="/opt/deps/gcc/lib64:/opt/deps/gcc/lib:$LD_LIBRARY_PATH"

export CMAKE_C_COMPILER="$CC"
export CMAKE_CXX_COMPILER="$CXX"

EOF

mkdir -p /etc/ld.so.conf.d
echo "/opt/deps/gcc/lib64" >/etc/ld.so.conf.d/gcc15.conf
