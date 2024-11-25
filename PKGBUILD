# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck/)

pkgname=libggml-git
_pkgname="${pkgname%-git}"
pkgver=r1410.8a3d799
pkgrel=2
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
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(lto)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local _cmake_options=(
    -B build
    -S "${_pkgname}"
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

  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
