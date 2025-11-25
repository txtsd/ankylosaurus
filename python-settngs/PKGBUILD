# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-settngs
_pkgname="${pkgname#python-}"
pkgver=0.11.1
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
sha256sums=('e0032724586143e5ef247fa523f4a258b78c2a37d45ab033eec4d986bab5771e')

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
