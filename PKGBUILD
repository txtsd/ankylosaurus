# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.3.1
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
sha256sums_x86_64=('3324b54e32ddade42fba8a9dd4be0164745c89303c17d4eaa8e1d18b37bc672f')
sha256sums_armv7h=('9e3470fe13ebb5021434480e8aec5d426f04ce2602b07c20cea0321cfa38548b')
sha256sums_aarch64=('d4e463e19c37e2a4024207a163c0fe6656f793f428cd6992b892365d614695a8')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
