# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qbittorrent-nightwalker
_pkgname="${pkgname#qbittorrent-}"
pkgver=0.0.1
pkgrel=1
pkgdesc='A dark but not black qBittorrent WebUI'
arch=(any)
url='https://github.com/CallMeBruce/nightwalker'
license=('MIT')
optdepends=(
  'qbittorrent: for use with qbittorrent'
  'qbittorrent-nox: for use with qbittorrent-nox'
)
options=(!debug)
install="${pkgname}.install"
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  ${pkgname}.install
)
sha256sums=('24ca2ec4dd34493f6aaa783f7a19100398ef9d4e2a3b4e9ff9be016a9bf376a3'
            'e41cb7cd5693aad398e37a59ffabe0fc00833639b9e599a4c1fca0db126e52e2')

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 webui.qrc "${pkgdir}/usr/share/${pkgname}/weubui.qrc"
  cp -dr --no-preserve=ownership private "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership public "${pkgdir}/usr/share/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
