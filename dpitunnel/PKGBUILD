# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel
__pkgname=DPITunnel
pkgver=1.0.3
pkgrel=1
pkgdesc='Free, simple and serverless solution against censorship for Linux PCs and routers'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/txtsd/DPITunnel'
license=('GPL-3.0-or-later')
depends=(
  'libnl'
  'gcc-libs'
  'zlib'
  'openssl'
  'glibc'
  'brotli'
  'ca-certificates-utils'
)
makedepends=(
  'cpp-httplib'
  'cmake'
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('294c3514ace51e6093a579f2db724b88d7565773bd82f2efc58756d0592880a5')

build() {
  cd "${__pkgname}-${pkgver}"
  cmake -B build .
  cmake --build build
}

package() {
  cd "${__pkgname}-${pkgver}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
