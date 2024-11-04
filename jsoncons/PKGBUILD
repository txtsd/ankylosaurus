# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jsoncons
pkgver=0.178.0
pkgrel=1
pkgdesc='A C++, header-only library for constructing JSON and JSON-like data formats'
arch=('any')
url='https://github.com/danielaparker/jsoncons'
license=('BSL-1.0')
makedepends=('cmake')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielaparker/jsoncons/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c531b4288bb08c9c2b36fba53f568bc800e93656830bcffc18a87a3af1f46290')

build() {
  cd "${pkgname}-${pkgver}"
  cmake \
    -S . \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

check() {
  cd "${pkgname}-${pkgver}/build/test"
  ctest .
}

package() {
  cd "${pkgname}-${pkgver}/build"

  DESTDIR="${pkgdir}" cmake --install .
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
