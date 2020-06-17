#!/bin/bash

INSTALL_DIR=/c/avr

mkdir build
cd build

PATH=$INSTALL_DIR/bin:$PATH
export PATH

CFLAGS='-D__USE_MINGW_ACCESS' \
LDFLAGS='-L/usr/local/lib -Wl,-rpath,/usr/local/lib' \
../configure \
--with-gmp=/usr/local \
--with-mpfr=/usr/local \
--with-mpc=/usr/local \
--prefix=$INSTALL_DIR \
--target=avr \
--enable-languages=c,c++ \
--with-dwarf2 \
--disable-nls \
--disable-libssp \
--disable-libada \
--disable-shared

make -j $NUMBER_OF_PROCESSORS
make install
