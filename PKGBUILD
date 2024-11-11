# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=libggml
pkgver=r1410.8a3d799
pkgrel=1
pkgdesc='Tensor library for machine learning'
url='https://github.com/ggerganov/ggml'
license=('MIT')
arch=(x86_64)
depends=(
  clblast
  glibc
  openblas
)
makedepends=(
  cmake
  git
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

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
    -DGGML_NATIVE=OFF
    -DGGML_AVX2=OFF
    -DGGML_AVX=OFF
    -DGGML_F16C=OFF
    -DGGML_FMA=OFF
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
