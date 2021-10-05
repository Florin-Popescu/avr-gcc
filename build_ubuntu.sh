#!/bin/bash

mkdir build
cd build

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
