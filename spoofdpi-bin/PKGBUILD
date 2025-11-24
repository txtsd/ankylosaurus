# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-bin
_pkgname=SpoofDPI
__pkgname=${pkgname%-bin}
pkgver=1.1.1
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
sha256sums_x86_64=('225116a3ebfde9d4f088087f00b343143c4ea8618725a3a96b7a329a7f744995')
sha256sums_armv7h=('8fc58c4e85b9c1ce19ab67007c1e25a92594ae4ca8d0d1c9186b4eaa0db74558')
sha256sums_aarch64=('a2e1130a93cb9e3fdc22d78698597b9b5aa07a3a3c862bcbb6cabd0f3d9a7af1')

package() {
  cd "${srcdir}"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
