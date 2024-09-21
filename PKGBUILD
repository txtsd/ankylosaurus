# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Martin Minka <martin.minka@gmail.com>

pkgname=otf-sans-forgetica
pkgver=1.0
pkgrel=2
pkgdesc="A font scientifically designed to help you remember your study notes"
url="https://web.archive.org/web/20220601143856/https://sansforgetica.rmit.edu.au/"
arch=(any)
license=('CC-BY-NC-4.0')
source=("https://archive.org/download/sans-forgetica/SansForgetica-Regular.otf")
sha256sums=('762820a564a1d588b2e1870825e319c381595cfe9761e310973391d04f9b7091')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 SansForgetica-Regular.otf "${pkgdir}/usr/share/fonts/OTF/"
}
