# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jsoncons
pkgver=1.4.3
pkgrel=1
pkgdesc='A C++, header-only library for constructing JSON and JSON-like data formats'
arch=(any)
url='https://github.com/danielaparker/jsoncons'
license=('BSL-1.0')
makedepends=(cmake)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielaparker/jsoncons/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6cc79df3bf10f3ecd5fbdd0a64deaaad35beda2767f8697e261e1af11e1e3526')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  cd "${pkgname}-${pkgver}"

  ctest --test-dir build/test --output-on-failure
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
