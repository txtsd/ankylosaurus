# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-bin
_pkgname=${pkgname/-bin}
__pkgname=DPITunnel
pkgver=1.0.2
pkgrel=1
pkgdesc="Free, simple and serverless solution against censorship for Linux PCs and routers"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/txtsd/DPITunnel"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.service")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-amd64.zip")
source_i686=("${url}/releases/download/${pkgver}/${_pkgname}-x86.zip")
source_armv7h=("${url}/releases/download/${pkgver}/${_pkgname}-armhf.zip")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-arm64.zip")
sha256sums=('8fc14a33357d08051f1b32466556688c74776a3c63d74aaa4754482c7292f28a')
sha256sums_x86_64=('e9950bc713d4210a3585a64f418d2c041742d2a2b55cdfa92b4fda24d34a45e1')
sha256sums_i686=('ad7ee7f7c0ef0ff89474be3bd39e47c6902b3ca816e93e9d4f1bb85ec626955c')
sha256sums_armv7h=('fe79e8a80c6d3ba6242d49e255399da43470973f8cec4a426cde8758c5a281dd')
sha256sums_aarch64=('294f877699093b200efbebaaa369f8125ff06aa617a2a7dcd9f33d28ff34b925')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
