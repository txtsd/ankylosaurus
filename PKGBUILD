# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-settngs
_pkgname="${pkgname#python-}"
pkgver=0.10.4
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
options=(!debug)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f8a2b67e711bc0fb2c73e7e812ccd6f3699fa8f158f6053a802ff1304d410fee')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
