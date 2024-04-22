# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-menu-data
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://lxqt-project.org'
license=("LGPL-2.1-only")
makedepends=(git cmake qt6-tools lxqt-build-tools-git)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd lxqt-menu-data
  git describe --always | sed 's:-:.r:;s:-:.:'
}

build() {
  cmake -B build -S lxqt-menu-data \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
