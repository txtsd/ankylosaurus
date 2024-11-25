# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qbittorrent-nightwalker
_pkgname="${pkgname#qbittorrent-}"
pkgver=r33.71d6775
pkgrel=1
pkgdesc='A dark but not black qBittorrent WebUI'
arch=(any)
url='https://github.com/CallMeBruce/nightwalker'
license=('MIT')
makedepends=('git')
optdepends=(
  'qbittorrent: for use with qbittorrent'
  'qbittorrent-nox: for use with qbittorrent-nox'
)
options=(!debug)
install="${pkgname}.install"
source=(
  "git+${url}#commit=71d677596608adc776d3e078a712d7a09624d520"
  ${pkgname}.install
)
sha256sums=('52b671e97194a4bca26acc1d47d0893f34a7a1b33f544ed0565643e3e9d6c6cb'
            'e41cb7cd5693aad398e37a59ffabe0fc00833639b9e599a4c1fca0db126e52e2')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 webui.qrc "${pkgdir}/usr/share/${pkgname}/weubui.qrc"
  cp -dr --no-preserve=ownership private "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership public "${pkgdir}/usr/share/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
