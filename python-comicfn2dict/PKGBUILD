# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-comicfn2dict
_pkgname="${pkgname#python-}"
pkgver=0.2.5
pkgrel=1
pkgdesc='Parse common comic filenames and return a dict of metadata attributes'
arch=(any)
url='https://github.com/ajslater/comicfn2dict'
license=('GPL-3.0-only')
depends=(python)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-deepdiff
  python-pytest
  python-pytest-cov
)
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('716197559a3ad77783ece68f452ab8669b473b452c638961981829677f32ec4b')

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
