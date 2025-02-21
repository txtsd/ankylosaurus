# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy-bin
_pkgname="${pkgname%-bin}"
pkgver=2025.2
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=(x86_64)
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=(
  alsa-lib
  gcc-libs
  glibc
  hicolor-icon-theme
  openssl
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('0989c7ea6d6e455cfb5aef98e5167096b3605f526056b683fbda384253d143d1')

package() {
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "share/applications/org.squidowl.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "share/metainfo/org.squidowl.${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"

  for dir in $(ls "share/icons/hicolor"); do
    install -Dm644 "share/icons/hicolor/${dir}/apps/org.squidowl.${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${dir}/apps/"
  done
}
