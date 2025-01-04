# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-comicfn2dict
_pkgname="${pkgname#python-}"
pkgver=0.2.4
pkgrel=1
pkgdesc='Parse common comic filenames and return a dict of metadata attributes'
arch=(any)
url='https://github.com/ajslater/comicfn2dict'
license=('GPL-3.0-only')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-deepdiff
  python-pytest
  python-pytest-cov
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a154d6405824b0323b81471f0977f5b884987012a7904ca135761000511d8835')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"

  pytest tests
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
