#!/bin/bash

case $(uname -o | cut -d '/' -f2) in
	"Msys")
		export CFLAGS="-D__USE_MINGW_ACCESS" \
		export CXXFLAGS="-D__USE_MINGW_ACCESS" \
		export LDFLAGS='-L/usr/local/lib -Wl,-rpath,/usr/local/lib' \

		SUDO=
		;;
	"Linux")
		NUMBER_OF_PROCESSORS=$(nproc)
		SUDO=sudo
		;;
esac

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

make all -j$NUMBER_OF_PROCESSORS
$SUDO make install
