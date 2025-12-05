# Maintainer: txtsd <aur.archlinux@iihavea.quest>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-user_agent
_pkgname=user_agent
pkgver=0.1.10
pkgrel=1
epoch=1
pkgdesc='Generate random, valid web user-agent headers'
arch=('any')
url='https://github.com/lorien/user_agent'
license=('MIT')
depends=(
  python
  python-pytz
  python-six
)
makedepends=(
  python-setuptools
  python-build
  python-installer
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/u/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b86537cb2a9d3bda0e2afcc654ec15b383502836877a67520654acadf73f1723')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl

  install -Dm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
