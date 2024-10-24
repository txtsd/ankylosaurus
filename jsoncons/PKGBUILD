# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jsoncons
pkgver=0.177.0
pkgrel=1
pkgdesc='A C++, header-only library for constructing JSON and JSON-like data formats'
arch=('any')
url='https://github.com/Thalhammer/jwt-cpp/'
license=('BSL-1.0')
makedepends=('cmake')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danielaparker/jsoncons/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a381d58489f143a3a515484f4ad6e32ae4d977033e1a455fecf8cdc4e2c9a49e')

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

