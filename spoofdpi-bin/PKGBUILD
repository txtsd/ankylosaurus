# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.5.3
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
# backup=(etc/spoofdpi.toml)
options=(!debug)
source=(
  "${__pkgname}.service"
)
source_x86_64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_x86_64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${__pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('8a61496c8621adbbc7b986388f9b2107e4c080d0d6e4d5a8dcb31a992dbc6ffc')
sha256sums_x86_64=('445515816efd8427f3bd809f8824d73c45596c0563330382bbf956aac3a7c4f2')
sha256sums_armv7h=('f1c16aaead57d58ea2e5393a789ccb8f82da958edc972bc41b689538a16cfa92')
sha256sums_aarch64=('137a9a26d329f7510eed94ee1026704c67acdf4e28656de4e32bdd9e13b0f14b')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
