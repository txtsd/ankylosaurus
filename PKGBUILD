# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname=otf-sans-forgetica
pkgver=1.0
pkgrel=3
pkgdesc='A font scientifically designed to help you remember your study notes'
url='https://web.archive.org/web/20220601143856/https://sansforgetica.rmit.edu.au/'
arch=(any)
license=('CC-BY-NC-4.0')
source=("${url}Common/Zips/Sans%20Forgetica.zip")
sha256sums=('972899e17ae7097c95a30661c882c696b6f17d73061da6632b8e976b3bf56f81')

package() {
  install -Dm644 'Sans Forgetica/SansForgetica-Regular.otf' -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
  install -Dm644 'Sans Forgetica/The story of Sans Forgetica.pdf' -t "${pkgdir}/usr/share/doc/${pkgname}"

}
