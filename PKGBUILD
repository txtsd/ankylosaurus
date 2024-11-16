# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Caesim404 <caesim404 at gmail dot com>

pkgname=python-cfscrape
_pkgname="${pkgname#python-}"
pkgver=2.1.1
pkgrel=2
pkgdesc="A simple Python module to bypass Cloudflare's anti-bot page using Requests"
arch=(any)
url='https://pypi.org/project/cfscrape/'
license=('MIT')
depends=(
  nodejs
  python
  python-requests
  python-urllib3
)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7c5ef94554e0d6ee7de7cd0d42051526e716ce6c0357679ee0b82c49e189e2ef')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
