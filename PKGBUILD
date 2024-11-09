# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=ttf-miracode
pkgver=1.0
pkgrel=2
pkgdesc='A sharp, readable, vector-y version of Monocraft, the monospace programming font based on Minecraft.'
arch=('any')
url='https://github.com/IdreesInc/Miracode'
license=('OFL-1.1')
source=(
  "https://github.com/IdreesInc/Miracode/releases/download/v${pkgver}/Miracode.ttf"
  "https://raw.githubusercontent.com/IdreesInc/Miracode/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=('43efc3fd33e5a8eb7befda984bf745eda844777326e1ae06fb074707e1aeb66a'
            'f69c147003e052dbc9d96c40a9f73647e72766cfda95a597b94ed827fe25acb1')

package() {
  install -Dm644 Miracode.ttf "${pkgdir}/usr/share/fonts/${pkgname}/Miracode.ttf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
