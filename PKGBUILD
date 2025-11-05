# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=0.12.2
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=(glibc)
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=(!debug)
source=(
  "${__pkgname}.conf.d"
  "${__pkgname}.service"
)
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-amd64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${__pkgname}-linux-arm64.tar.gz")
sha256sums=('6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            'a32456dfab36dd2dcfcdf9f7b24bbe3646c9cecda023180e2e658001427045da')
sha256sums_x86_64=('fbf149cc925b553636e3b29aeb5d25efb52e0511537aac5771b63c7676f8f547')
sha256sums_armv7h=('fd41cf8e0bc3db999ef41f42be33b352e43a7f919657c00670dd171226703c48')
sha256sums_aarch64=('2ab669b0b6d40b8de74cb806ed07b2e20c9515cc485ae554a51e5d55a4531127')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
