pkgname=avr-gcc
pkgver=9.3.0
pkgrel=2
epoch=
pkgdesc="GNU Compiler Collection for AVR microcontrollers"
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/Florin-Popescu/avr-gcc/archive/refs/tags/v${pkgver}-${pkgrel}.tar.gz)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	mkdir -p ../build
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	cd ../build

	CFLAGS=${CFLAGS/-pipe/}
	CXXFLAGS=${CXXFLAGS/-pipe/}

	# Force this for now, doesn't seem to be picked up via patch from https://bugs.archlinux.org/task/70701
	CFLAGS+=" -Wno-format -Wno-format-security"
	CXXFLAGS+=" -Wno-format -Wno-format-security"

	../"${pkgname}-${pkgver}-${pkgrel}"/configure \
		--target=avr \
		--enable-languages=c,c++ \
		--with-dwarf2 \
		--disable-nls \
		--disable-libssp \
		--disable-libada \
		--disable-shared

	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${pkgrel}"
	cd ../build
	make DESTDIR="$pkgdir/" install
}
