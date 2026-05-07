# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.5.1
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
sha256sums=('6aa0ecb1d0073b970d0f0a71fae521ed1342a4aa9d8ed1887fdadb2f751edb92'
            '76a22a11e7ffa2c362f32d2e05cee16b056a6ce9b64b3ea10ece8732e77e917a')
sha256sums_x86_64=('d8a8ff57d15c1cb584b967e14b63158036a3288d19f03c954c3b275ec2c25583')
sha256sums_armv7h=('fdb9f754e6b54959c7e9c847d211d127c01c0d25db1b95f31995ac51858090ef')
sha256sums_aarch64=('5d8d9f5a80b2cc96f471f08932d1aafb12646ff7d87d9616dee28d0e8f21bcd6')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
