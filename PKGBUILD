# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-settngs
_pkgname="${pkgname#python-}"
pkgver=0.11.0
pkgrel=1
pkgdesc='A library for managing settings'
arch=(any)
url='https://github.com/lordwelch/settngs'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
# checkdepends=(python-pytest)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a59ece23c0d86f185a73b18f9d33cc8476175ce302ae2d4aad357a61cf50965d')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

# check() {
#   cd "${_pkgname}-${pkgver}"
#
#   pytest tests
# }

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
