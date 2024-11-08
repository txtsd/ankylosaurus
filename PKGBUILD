# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: lanthora <lanthora at outlook dot com>
# Contributor epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgname=usockets
_pkgname=uSockets
pkgver=0.8.8
pkgrel=2
pkgdesc='Miniscule cross-platform eventing, networking & crypto for async applications.'
arch=(x86_64)
url='https://github.com/uNetworking/uSockets'
license=('Apache-2.0')
depends=(
  gcc-libs
  glibc
  openssl
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/uNetworking/uSockets/archive/refs/tags/v${pkgver}.tar.gz"
  "usockets-${pkgver}-Makefile.patch"
)
sha256sums=('d14d2efe1df767dbebfb8d6f5b52aa952faf66b30c822fbe464debaa0c5c0b17'
            'a10d858c209b34304b7301faa9aea6885c7300f643038f7d356451600c2be4c4')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch < "${srcdir}/usockets-${pkgver}-Makefile.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  make VERSION="${pkgver}" WITH_OPENSSL=1 default
}

package() {
  cd "${_pkgname}-${pkgver}"
  make VERSION="${pkgver}" DESTDIR="${pkgdir}/" install
}
