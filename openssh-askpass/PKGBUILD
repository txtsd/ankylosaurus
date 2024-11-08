# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Massimiliano Torromeo <Massimiliano.Torromeo AT gmail DOT com>

pkgname=openssh-askpass
pkgver=2.1.0
pkgrel=5
pkgdesc='A plasma-like passphrase dialog for ssh'
arch=(x86_64)
url='http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=openssh-askpass&full=0'
license=('GPL-2.0-or-later')
depends=(
  gcc-libs
  glibc
  libx11
  libxcb
  openssh
  qt5-base
  qt5-svg
  qt5-x11extras
  xcb-util-keysyms
  zlib
)
makedepends=(cmake)
provides=(x11-ssh-askpass)
source=("http://hugo.pereira.free.fr/software/tgz/${pkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('d7728ae61b49b2e390d9e2c1faba3441c0e9899a86be887e0686042ab302be4b')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_QT5='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
}
