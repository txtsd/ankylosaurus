# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: The one with the braid <info@braid.business>
# Contributor: Robert Falkenberg <robert.falkenberg@srs.io>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=openssl-static
_pkgname=${pkgname%%-static}
pkgver=3.3.1
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security (with static libs)'
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'pentium4' 'riscv64')
url='https://www.openssl.org'
license=('Apache-2.0')
depends=('glibc')
makedepends=('perl')
optdepends=('ca-certificates' 'perl')
replaces=('openssl-perl' 'openssl-doc')
provides=('libcrypto.so' 'libssl.so' "openssl=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/ssl/openssl.cnf')
options=('staticlibs')
source=("https://www.openssl.org/source/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        'ca-dir.patch')
sha256sums=('777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e'
            'SKIP'
            '0a32d9ca68e8d985ce0bfef6a4c20b46675e06178cc2d0bf6d91bd6865d648b7')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491'
              '7953AC1FBC3DC8B3B292393ED5E9E43F7DF9EE8C'
              'A21FAB74B0088AA361152586B8EF1A6BA9DA2D5C'
              'EFC0A467D613CB83C7ED6D30D894E2CE8B3D79F5')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# set ca dir to /etc/ssl by default
	patch -Np1 -i "${srcdir}/ca-dir.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared enable-ktls enable-ec_nistp_64_gcc_128 linux-${CARCH}

	make depend
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	patch -Rp1 -i "${srcdir}/ca-dir.patch"

	make HARNESS_JOBS=$(nproc) test

	patch -Np1 -i "${srcdir}/ca-dir.patch"
	# re-run make to re-generate CA.pl from the patched .in file.
	make apps/CA.pl
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs

	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
