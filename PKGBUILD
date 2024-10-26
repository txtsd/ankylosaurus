# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-hip
_pkgname=${pkgname%%-hip}
pkgver=b3982
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with AMD ROCm optimizations)"
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/ggerganov/llama.cpp'
license=('MIT')
depends=(
  'curl'
  'gcc-libs'
  'glibc'
  'python'
  'python-numpy'
  'python-sentencepiece'
  'hipblas'
  'hip-runtime-amd'
  'openmp'
  'rocblas'
)
makedepends=(
  'rocm-hip-runtime'
  'rocm-hip-sdk'
  'clblast'
  'cmake'
  'git'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(lto)
source=(
  "git+${url}#tag=${pkgver}"
  "git+https://github.com/nomic-ai/kompute.git"
  'llama.cpp.conf'
  'llama.cpp.service'
)
sha256sums=('24615514be685a63a7d5ce3d7823e27abc09f67fef97bd3c021d1342d1cd4942'
            'SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '065f69ccd7ac40d189fae723b58d6de2a24966e9b526e0dbfa3035a4c46a7669')

prepare() {
  cd "${_pkgname}"

  git submodule init
  git config submodule.kompute.url "${srcdir}/kompute"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${_pkgname}"
  export CC=/opt/rocm/llvm/bin/clang
  export CXX=/opt/rocm/llvm/bin/clang++
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DGGML_ALL_WARNINGS_3RD_PARTY=ON \
    -DGGML_BLAS=ON \
    -DGGML_LTO=ON \
    -DGGML_RPC=ON \
    -DLLAMA_CURL=ON \
    -DLLAMA_FATAL_WARNINGS=ON \
    -DGGML_HIPBLAS=ON
  cmake --build build --config Release
}

package() {
  cd "${_pkgname}"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "${srcdir}/llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
}
