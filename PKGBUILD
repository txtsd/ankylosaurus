# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=jwt-cpp
pkgver=0.7.0
pkgrel=2
pkgdesc='A header only library for creating and validating JSON Web Tokens in C++'
arch=(any)
url='https://github.com/Thalhammer/jwt-cpp/'
license=('MIT')
makedepends=(
  cmake
  gtest
  nlohmann-json
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Thalhammer/jwt-cpp/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9eb270e3ba8221e4b2bc38723c9a1cb4fa6c241a42908b9a334daff31137406')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DJWT_BUILD_TESTS=ON
  cmake --build build
}

check() {
  cd "${pkgname}-${pkgver}"

  ./build/tests/jwt-cpp-test
  # ctest --test-dir build/tests --output-on-failure
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Handle files in incorrect directory
  install -dm755 ${pkgdir}/usr/lib/cmake
  mv "${pkgdir}/usr/cmake/jwt-cpp-config-version.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-config-version.cmake"
  mv "${pkgdir}/usr/cmake/jwt-cpp-config.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-config.cmake"
  mv "${pkgdir}/usr/cmake/jwt-cpp-targets.cmake" "${pkgdir}/usr/lib/cmake/jwt-cpp-targets.cmake"
  rm -rf "${pkgdir}/usr/cmake"
}
