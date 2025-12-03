# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contribuor: Ben Goldberg <benaaron.dev>

pkgname=python-rtfunicode
_pkgname=${pkgname#python-}
pkgver=2.0
pkgrel=2
pkgdesc='Encoder for unicode to RTF 1.5 command sequences'
arch=(any)
url='https://pypi.org/project/rtfunicode'
license=('BSD-2-Clause')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('97d2e860fd4abaae2de5df1e59bb18b85ba0caebf40c53de8ddb79ec8d884401')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
