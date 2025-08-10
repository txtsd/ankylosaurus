# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=otf-monocraft
pkgver=4.1
pkgrel=1
pkgdesc='A programming font based on the typeface used in Minecraft'
arch=(any)
url='https://github.com/IdreesInc/Monocraft'
license=('OFL-1.1')
makedepends=(fontforge)
source=("Monocraft-${pkgver}.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b099350b3d33f2f67f161daabbfaece7f3f1d953330edc615cd679585cfe874b')

build() {
    cd "Monocraft-${pkgver}/src"

    python monocraft.py
}

package() {
    cd "Monocraft-${pkgver}"

    install -Dm644 dist/Monocraft.otf -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
