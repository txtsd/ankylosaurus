# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-bin
_pkgname="${pkgname%-bin}"
__pkgname=DPITunnel
pkgver=1.0.3
pkgrel=1
pkgdesc='Free, simple and serverless solution against censorship for Linux PCs and routers'
arch=(x86_64 i686 armv7h aarch64)
url='https://github.com/txtsd/DPITunnel'
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("${_pkgname}.service")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-x86_64.zip")
source_i686=("${url}/releases/download/${pkgver}/${_pkgname}-x86.zip")
source_armv7h=("${url}/releases/download/${pkgver}/${_pkgname}-armhf.zip")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-aarch64.zip")
sha256sums=('8fc14a33357d08051f1b32466556688c74776a3c63d74aaa4754482c7292f28a')
sha256sums_x86_64=('cf3ba8bea726697d6f29c27c8b23eb107e79508cd49f2ef25a2b800e032325ed')
sha256sums_i686=('c9763564d61f6d05b030e880ef2e3f8196803d527553d33ce790ef7e8e482790')
sha256sums_armv7h=('37d4b8a4e8a01f3c2277c6cc820056aff77ba898cf9fdc14d406e6dc5e5be4f8')
sha256sums_aarch64=('466f61b475b7fced7bd4f2c977fbbffaf49c9922a45b57ec7c55f8318f0c53f7')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
