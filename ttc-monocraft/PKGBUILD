# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttc-monocraft
pkgver=4.0
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=(OFL-1.1)
makedepends=("fontforge")
source=("Monocraft-$pkgver.tar.gz::https://github.com/IdreesInc/Monocraft/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a07fcb958aa6cf504d61eca8ab7b8641acb2844f11c9914fa3f5ead7d27c2b19')


build() {
    cd "Monocraft-$pkgver/src"

    python monocraft.py --all --output-ttc
}

package() {
    cd "Monocraft-$pkgver"

    install -Dm644 "dist/Monocraft-no-ligatures.ttc" "$pkgdir/usr/share/fonts/TTF/Monocraft-no-ligatures.ttc"
    install -Dm644 "dist/Monocraft.ttc" "$pkgdir/usr/share/fonts/TTF/Monocraft.ttc"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
