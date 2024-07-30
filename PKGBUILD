# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy-bin
_pkgname="${pkgname/-bin}"
pkgver=2024.9
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme' 'alsa-lib')
provides=('halloy')
conflicts=('halloy')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('86ffefe36116fbdc5d6adfec12c8112971faba1db88043550b783e067e40f520')

package() {
  install -Dm755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/share/applications/org.squidowl.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/share/metainfo/org.squidowl.${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"

  for dir in $(ls "${srcdir}/share/icons/hicolor")
  do
    install -Dm644 "${srcdir}/share/icons/hicolor/${dir}/apps/org.squidowl.${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${dir}/apps/"
  done
}
