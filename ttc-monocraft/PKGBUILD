# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttc-monocraft
pkgver=4.1
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=(OFL-1.1)
source=("${pkgname}-${pkgver}.ttc::https://github.com/IdreesInc/Monocraft/releases/download/v${pkgver}/Monocraft.ttc")
sha256sums=('09eb83095442e8068ec843f15ccb35717fa783616f0a6079605c4c4522920381')

package() {
    install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/${pkgname#ttc-}/Monocraft.ttc"
}
