INSTALL_DIR=/home/avr-gcc

./contrib/download_prerequisites

mkdir build
cd build

PATH=$PATH:$INSTALL_DIR/bin
export PATH

../configure \
--prefix=$INSTALL_DIR \
--target=avr \
--enable-languages=c,c++ \
--disable-nls \
--disable-libssp \
--disable-libada \
--with-dwarf2 \
--disable-shared \
--enable-static \
--enable-mingw-wildcard \
--host=x86_64-w64-mingw32

make all -j $NUMBER_OF_PROCESSORS
make install
