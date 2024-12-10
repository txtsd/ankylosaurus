# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=archosaur
pkgver=1.0.0
pkgrel=3
pkgdesc='A PKGBUILD management framework for the Arch User Repository'
arch=(any)
url="https://github.com/txtsd/${pkgname}"
license=('GPL-2.0-or-later')
depends=(bash openssh)
makedepends=(asciidoc)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('61c4abcd01ec8b1058d994c34725e7258c534c5f6c3f2b692785de41e322f662')

build() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
