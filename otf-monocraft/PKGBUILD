# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=4.2.1
pkgrel=1
pkgdesc='A programming font based on the typeface used in Minecraft'
arch=(any)
url='https://github.com/IdreesInc/Monocraft'
license=('OFL-1.1')
makedepends=(fontforge)
options=(!debug)
source=("Monocraft-${pkgver}.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fac3925dd527e1368423c03fa89ba5645727f66d5801a3536cddfa429c2517a9')

build() {
  cd "Monocraft-${pkgver}/src"

  python monocraft.py
}

package() {
  cd "Monocraft-${pkgver}"

  install -Dm644 dist/Monocraft.otf -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
