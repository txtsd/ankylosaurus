# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.1.3
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=(!debug)
source=(
  "${__pkgname}.conf.d"
  "${__pkgname}.service"
)
source_x86_64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            'a32456dfab36dd2dcfcdf9f7b24bbe3646c9cecda023180e2e658001427045da')
sha256sums_x86_64=('a7bc920f99575b0b1696a1f8b847b6b816e0075836b50267506eea0b362b0c01')
sha256sums_armv7h=('8a61ab5cad3ad68b48ffca6076120f342115e1dee8cefd6e3bdb85204fbcdb15')
sha256sums_aarch64=('01b2ae892bde49cac8334add3b045fe05f97092c5a9520886d20c84f7b4f8781')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
