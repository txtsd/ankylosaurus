# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttc-monocraft
pkgver=4.2
pkgrel=1
pkgdesc="A programming font based on the typeface used in Minecraft"
arch=(any)
url="https://github.com/IdreesInc/Monocraft"
license=(OFL-1.1)
options=(!debug)
source=("${pkgname}-${pkgver}.ttc::https://github.com/IdreesInc/Monocraft/releases/download/v${pkgver}/Monocraft.ttc")
sha256sums=('3a03c49166d9fedc5adf142679310b37cfc716bc90d8a916b9275d88e81eadf5')

package() {
  install -Dm644 "${pkgname}-${pkgver}.ttc" "${pkgdir}/usr/share/fonts/${pkgname#ttc-}/Monocraft.ttc"
}
