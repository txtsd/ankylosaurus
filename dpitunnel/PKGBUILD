# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel
__pkgname=DPITunnel
pkgver=1.0.2
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
depends=('libnl' 'gcc-libs' 'zlib' 'openssl' 'glibc' 'brotli' 'ca-certificates-utils')
makedepends=('cpp-httplib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('58077ac04d529dc3cf094a67339c4d2a827e640dd11424b34412b21b1ca3b593')

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
