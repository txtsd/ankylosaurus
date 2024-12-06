# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp
pkgver=b4276
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with OpenBLAS CPU optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  openblas
  openblas64
  python
  python-numpy
  python-sentencepiece
)
makedepends=(
  cmake
  git
  openmp
)
options=(lto)
source=(
  "git+${url}#tag=${pkgver}"
  "git+https://github.com/nomic-ai/kompute.git"
  llama.cpp.conf
  llama.cpp.service
)
sha256sums=('6240d39e47484264e8ba1922aadabd9e3771b3a0c79d53d7159718daac905585'
            'SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

prepare() {
  cd "${pkgname}"

  git submodule init
  git config submodule.kompute.url "${srcdir}/kompute"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_options=(
    -B build
    -S "${pkgname}"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DBUILD_SHARED_LIBS=ON
    -DGGML_STATIC=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DLLAMA_CURL=ON
    -DGGML_BLAS=ON
    -DGGML_BLAS_VENDOR=OpenBLAS
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure -L 'main|curl' --verbose --timeout 900
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm "${pkgdir}/usr/include/"ggml*

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
