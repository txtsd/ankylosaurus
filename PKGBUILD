# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Maintainer: txtsd  <aur.archlinux@ihavea.quest>
# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=lxqt-menu-data-git
_pkgname=${pkgname%-git}
pkgver=2.1.0.r1.eda2916
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
url='https://lxqt-project.org'
license=('LGPL-2.1-only')
makedepends=(
  cmake
  git
  lxqt-build-tools-git
  qt6-tools
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -S lxqt-menu-data -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
