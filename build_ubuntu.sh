#!/bin/bash

mkdir build
cd build

chmod +x ../configure
chmod +x ../fixincludes/configure
chmod +x ../move-if-change
chmod +x ../libgcc/mkheader.sh
../configure \
--target=avr \
--enable-languages=c,c++ \
--with-dwarf2 \
--disable-nls \
--disable-libssp \
--disable-libada \
--disable-shared

make -j$(nproc)
make install
