# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=4.2
pkgrel=1
pkgdesc='A programming font based on the typeface used in Minecraft'
arch=(any)
url='https://github.com/IdreesInc/Monocraft'
license=('OFL-1.1')
makedepends=(fontforge)
options=(!debug)
source=("Monocraft-${pkgver}.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1ba282f25a29c7083418435db221fec71bf7509a9013c550c8950c6da857034')

build() {
  cd "Monocraft-${pkgver}/src"

  python monocraft.py
}

package() {
  cd "Monocraft-${pkgver}"

  install -Dm644 dist/Monocraft.otf -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
