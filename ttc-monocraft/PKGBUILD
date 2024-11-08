# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttc-monocraft
pkgver=4.0
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=(OFL-1.1)
source=("${pkgname}-${pkgver}.ttc::https://github.com/IdreesInc/Monocraft/releases/download/v${pkgver}/Monocraft.ttc")
sha256sums=('481ce5fd7d8f40eab5718e1d96a3bcf410f00ab3fefcb63067d5f6e29d8b0c2b')

package() {
    install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/${pkgname#ttc-}/Monocraft.ttc"
}
