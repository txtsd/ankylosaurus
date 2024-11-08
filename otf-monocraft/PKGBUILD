# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=4.0
pkgrel=2
pkgdesc='A programming font based on the typeface used in Minecraft'
arch=(any)
url='https://github.com/IdreesInc/Monocraft'
license=('OFL-1.1')
makedepends=(fontforge)
source=("Monocraft-${pkgver}.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a07fcb958aa6cf504d61eca8ab7b8641acb2844f11c9914fa3f5ead7d27c2b19')

build() {
    cd "Monocraft-${pkgver}/src"

    python monocraft.py
}

package() {
    cd "Monocraft-${pkgver}"

    install -Dm644 dist/Monocraft.otf -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
