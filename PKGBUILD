# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contribuor: Ben Goldberg <benaaron.dev>

pkgname=python-rtfunicode
_pkgname=${pkgname#python-}
pkgver=2.3
pkgrel=1
pkgdesc='Encoder for unicode to RTF 1.5 command sequences'
arch=(any)
url='https://pypi.org/project/rtfunicode'
license=('BSD-2-Clause')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-uv-build
  python-wheel
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('800d1ef6dcc01505a5912958e7267332ccb1a58e0c6faf213af5f9cd85fa321a')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
