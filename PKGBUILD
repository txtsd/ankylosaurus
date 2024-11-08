# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel
__pkgname=DPITunnel
pkgver=1.0.3
pkgrel=1
pkgdesc='Free, simple and serverless solution against censorship for Linux PCs and routers'
arch=(x86_64 i686 armv7h aarch64)
url='https://github.com/txtsd/DPITunnel'
license=('GPL-3.0-or-later')
depends=(
  brotli
  ca-certificates-utils
  gcc-libs
  glibc
  libnl
  openssl
  zlib
)
makedepends=(
  cmake
  cpp-httplib
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('294c3514ace51e6093a579f2db724b88d7565773bd82f2efc58756d0592880a5')

build() {
  cd "${__pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  cd "${__pkgname}-${pkgver}"

  ctest --test-dir build --output-on-failure
}

package() {
  cd "${__pkgname}-${pkgver}"

  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
