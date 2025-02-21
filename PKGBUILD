# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: lanthora <lanthora at outlook dot com>
# Contributor epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgname=uwebsockets
_pkgname=uWebSockets
pkgver=20.74.0
pkgrel=1
pkgdesc='Simple, secure & standards compliant web server for the most demanding of applications'
arch=(any)
url='https://github.com/uNetworking/uWebSockets'
license=('Apache-2.0')
depends=(usockets)
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v${pkgver}.tar.gz"
  uwebsockets.pc
)
sha256sums=('e1d9c99b8e87e78a9aaa89ca3ebaa450ef0ba22304d24978bb108777db73676c'
            '5433dee099ea6f6fe97ef200cc19aadc71ca5066d7f5238070c25cd040dfb520')

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm644 src/*.h -t "${pkgdir}/usr/include/${_pkgname}/"
  install -Dm644 "${srcdir}/uwebsockets.pc" "${pkgdir}/usr/lib/pkgconfig/uwebsockets.pc"
}
