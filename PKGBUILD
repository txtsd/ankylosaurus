# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qbittorrent-nightwalker
_pkgname="${pkgname#qbittorrent-}"
pkgver=r32.9b9bcd5
pkgrel=1
pkgdesc='A dark but not black qBittorrent WebUI'
arch=(any)
url='https://github.com/CallMeBruce/nightwalker'
license=('LicenseRef-Unknown')
makedepends=('git')
optdepends=(
  'qbittorrent: for use with qbittorrent'
  'qbittorrent-nox: for use with qbittorrent-nox'
)
options=(!debug)
install="${pkgname}.install"
source=(
  "git+${url}#commit=9b9bcd523cdfa1cdf964e9739638d04669381dc9"
  ${pkgname}.install
)
sha256sums=('03fd457258a15445d2a28653d8cb1a54385e9d126afda3220856bf3be777cea4'
            'e41cb7cd5693aad398e37a59ffabe0fc00833639b9e599a4c1fca0db126e52e2')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 'webui.qrc' "${pkgdir}/usr/share/${pkgname}/weubui.qrc"
  cp -dr --no-preserve=ownership private "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership public "${pkgdir}/usr/share/${pkgname}"
}
