#!/bin/bash

set -eu

update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100

update-alternatives --install /usr/bin/cc cc /usr/bin/clang-20 100
update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-20 100
