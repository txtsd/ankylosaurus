# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qbittorrent-nightwalker
pkgver=r29.e782565
pkgrel=1
pkgdesc='A dark but not black qBittorrent WebUI'
arch=(any)
url='https://github.com/binhex/fork-nightwalker'
license=('LicenseRef-Unknown')
makedepends=('git')
optdepends=(
  'qbittorrent: for use with qbittorrent'
  'qbittorrent-nox: for use with qbittorrent-nox'
)
options=(!debug)
install="${pkgname}.install"
source=(
  "git+${url}#commit=e782565e10ccb3f1ee801f5a5181c105eb3b1e1c"
  ${pkgname}.install
)
sha256sums=('3971786c7aa0609102212f34226bda49870fc9dbdc22ecf885b68b1691071062'
            'e41cb7cd5693aad398e37a59ffabe0fc00833639b9e599a4c1fca0db126e52e2')

pkgver() {
  cd "fork-nightwalker"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "fork-nightwalker"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 'webui.qrc' "${pkgdir}/usr/share/${pkgname}/weubui.qrc"
  cp -dr --no-preserve=ownership private "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership public "${pkgdir}/usr/share/${pkgname}"
  cp -dr --no-preserve=ownership translations "${pkgdir}/usr/share/${pkgname}"
}
