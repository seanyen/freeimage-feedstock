#!/bin/bash

dos2unix Source/FreeImage/*.cpp

patch -p1 < $RECIPE_DIR/patches/Use-system-libs.patch
patch -p1 < $RECIPE_DIR/patches/Fix-compatibility-with-system-libpng.patch
patch -p1 < $RECIPE_DIR/patches/CVE-2019-12211-13.patch

mkdir -p build
cd build

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_MODULE_PATH="$RECIPE_DIR/cmake;${CMAKE_MODULE_PATH}" \
      ..

make VERBOSE=1 -j${CPU_COUNT}
make install
