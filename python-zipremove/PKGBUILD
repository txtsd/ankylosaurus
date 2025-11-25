# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-zipremove
_pkgname="${pkgname/python-/}"
pkgver=0.8.0
pkgrel=1
pkgdesc='Extends `zipfile` with `remove`-related functionalities'
arch=('any')
url='https://github.com/danny0838/zipremove'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ee894ece5feb4d796c798cb8b7ee73710974835b91459c56496159abe237522c')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.txt
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}
