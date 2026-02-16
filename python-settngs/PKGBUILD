# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-settngs
_pkgname="${pkgname#python-}"
pkgver=0.11.2
pkgrel=1
pkgdesc='A library for managing settings'
arch=(any)
url='https://github.com/lordwelch/settngs'
license=('MIT')
depends=(
  python
  python-typing_extensions
)
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
sha256sums=('f0947eed808b3adca0be20b7098580d1f8648f2a80e6ca32bcd2d0456ae387ee')

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
