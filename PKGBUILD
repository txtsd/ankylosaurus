# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: lanthora <lanthora at outlook dot com>
# Contributor epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgname=uwebsockets
_pkgname=uWebSockets
pkgver=20.68.0
pkgrel=2
pkgdesc="Simple, secure & standards compliant web server for the most demanding of applications"
arch=('any')
url="https://github.com/uNetworking/uWebSockets"
license=('Apache-2.0')
depends=('usockets')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v${pkgver}.tar.gz"
  "uwebsockets.pc"
)
sha256sums=('02dd1dd2925c639c01222d19f4ddd6fe12261571bcb3befc7eedaf8fa75c008f'
            '5433dee099ea6f6fe97ef200cc19aadc71ca5066d7f5238070c25cd040dfb520')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/include/${_pkgname}/" src/*.h
  install -Dm644 "${srcdir}/uwebsockets.pc" "${pkgdir}/usr/lib/pkgconfig/uwebsockets.pc"
}

#vim: syntax=sh
