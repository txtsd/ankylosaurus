# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.2.1
pkgrel=3
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
sha256sums_x86_64=('959b5cc5f1186d931c89c9c3fb047b7fe695ff92abd77ed8da623e5029933959')
sha256sums_armv7h=('2e100f293e78940364339c7d7bbe051b2d5799c93892709355bf85484c20bd26')
sha256sums_aarch64=('0d235d02c5e9806aa255eb5cf3d346c942b4521b9f74fc027dedf155905479d9')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
