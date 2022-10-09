#!/bin/bash

TOOL=avr-gcc
ARCH=$(uname -m)

if [ -x "$(command -v dpkg-deb)" ]; then
	DISTRO=deb
elif [ -x "$(command -v makepkg)" ]; then
	DISTRO=arch
fi

PACKAGE="$TOOL"_"$ARCH"
DESTDIR=./"$PACKAGE"

if [ $DISTRO == deb ]; then
	mkdir $DESTDIR
	cd ../build
	make install
	cd ../avr-gcc
	dpkg-deb --build --root-owner-group $PACKAGE
elif [ $DISTRO == arch ]; then
	makepkg
fi
