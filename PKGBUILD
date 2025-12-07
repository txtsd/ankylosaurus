# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttc-monocraft
pkgver=4.2.1
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=(OFL-1.1)
options=(!debug)
source=("${pkgname}-${pkgver}.ttc::https://github.com/IdreesInc/Monocraft/releases/download/v${pkgver}/Monocraft.ttc")
sha256sums=('0ea1aea12f03d552a469fc017f19ea927b53bf9d21e60a41c5c476c3faf3c7f9')

package() {
  install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/${pkgname#ttc-}/Monocraft.ttc"
}
