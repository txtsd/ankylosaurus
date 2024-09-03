# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%%-bin}
pkgver=0.11.1
pkgrel=3
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=('!debug')
source=("${__pkgname}.conf.d"
        "${__pkgname}.service")
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-amd64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm64.tar.gz")
sha256sums=('6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            '2e07c009e36618ea7a005dc8b576a6c4d2e1d43cbd257803bae242a4cb785020')
sha256sums_x86_64=('42395aad87444be89f53ad658ff0c3d1d38e8f939592288d99b57b213ff08aa8')
sha256sums_armv7h=('b9f510b668e6d4943325b15128fe78077ea4b70d4e88c3a41510aa0c0c31feaf')
sha256sums_aarch64=('b95fe82facef5d2c78dff5becb00397dd49aeebe5752276677da6d0f2e324158')


package() {
    cd "${srcdir}"
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}

