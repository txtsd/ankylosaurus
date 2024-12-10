# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=aleo-fonts
pkgver=2.0
pkgrel=3
pkgdesc='Slab serif type family designed by Alessio Laiso'
arch=('any')
url='https://alessiolaiso.com/aleo-font'
license=('OFL-1.1')
options=(!debug)
source=("https://alessiolaiso.com/downloads/Aleo_v${pkgver}.zip")
sha256sums=('ed8c6f6b04b3bf1df367ef0e0f272a09056e5dcd34d58f7e7cdb35ad504a1591')

package() {
  cd "Aleo_v${pkgver}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname%-fonts}" "otf/"*.otf
  install -Dm644 "SIL Open Font License 1.1.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
