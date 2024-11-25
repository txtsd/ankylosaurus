# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=libggml
pkgver=r1475.6fcbd60
pkgrel=1
pkgdesc='Tensor library for machine learning'
url='https://github.com/ggerganov/ggml'
license=('MIT')
arch=(x86_64)
depends=(
  clblast
  glibc
  blas-openblas
)
makedepends=(
  cmake
  git
)
options=(lto)
_commit=6fcbd60bc72ac3f7ad43f78c87e535f2e6206f58
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('ce5fdb68b624f771c36053bba84d43590fedf2063c386f40f36a9fe6c46de172')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "${pkgname}"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=ON
    -DGGML_BUILD_TESTS=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
