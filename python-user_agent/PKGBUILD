# Maintainer: txtsd <aur.archlinux@iihavea.quest>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-user_agent
_pkgname=user_agent
pkgver=0.1.14
pkgrel=1
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
sha256sums=('5b25bedb43f89dff7d1ab569a96c16bea6f151a2f07b6323d4356ead5a96e4d2')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl

  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
