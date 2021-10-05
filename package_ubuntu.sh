export DESTDIR="$(pwd)/avr-gcc_ubuntu_$1" && make install
dpkg-deb --build --root-owner-group avr-gcc_ubuntu_$1
