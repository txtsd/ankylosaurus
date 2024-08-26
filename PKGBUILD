# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%%-bin}
_binname=spoof-dpi
pkgver=0.10.11
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::${url}/releases/download/${pkgver}/${_binname}-linux-amd64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::${url}/releases/download/${pkgver}/${_binname}-linux-arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::${url}/releases/download/${pkgver}/${_binname}-linux-arm64.tar.gz")
sha256sums_x86_64=('6359c73e61296d7b0f6fd4365a60dd9c2472db93a4a7ad55e137649b293f90e8')
sha256sums_armv7h=('53833258c31dd3f438d8c4e563ab8ad987afa61a5a1fcf43d5cf357ff4e4cd61')
sha256sums_aarch64=('1c7b97471584c6e52bd5b3e6d25793e64f62a465383b67bc662091fe88a34dee')


package() {
    cd "${srcdir}"
    install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}

