# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jwt-cpp
pkgver=0.7.0
pkgrel=1
pkgdesc='A header only library for creating and validating JSON Web Tokens in C++'
arch=('any')
url='https://github.com/Thalhammer/jwt-cpp/'
license=('MIT')
makedepends=('cmake' 'gtest' 'nlohmann-json')
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Thalhammer/jwt-cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9eb270e3ba8221e4b2bc38723c9a1cb4fa6c241a42908b9a334daff31137406')

build() {
  cd "${pkgname}-${pkgver}"
  cmake \
    -S . \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr/share" \
    -DJWT_BUILD_TESTS=ON
  cmake --build build
}

check() {
  cd "${pkgname}-${pkgver}"
  ./build/tests/jwt-cpp-test
}

package() {
  cd "${pkgname}-${pkgver}/build"
  
  DESTDIR="${pkgdir}" cmake --install .
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

