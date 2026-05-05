# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jsoncons
pkgver=1.7.0
pkgrel=1
pkgdesc='A C++, header-only library for constructing JSON and JSON-like data formats'
arch=(any)
url='https://github.com/danielaparker/jsoncons'
license=('BSL-1.0')
makedepends=(cmake)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielaparker/jsoncons/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5a2aad4e791a1c93b0b0b326973459753a96a4c48d06d3035cd0ea0d262198d4')

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
