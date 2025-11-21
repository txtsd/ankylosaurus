# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-wassima
_pkgname="${pkgname/python-/}"
pkgver=2.0.2
pkgrel=1
pkgdesc='No more certifi! System trust store at hand. In Pure Python.'
arch=('any')
url='https://github.com/jawah/wassima'
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('96e8ca6518ecbd9b02abd33fb8d9dff34fc35e952fee3e42723fc76bfd132f5a')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" {CHANGELOG,README,SECURITY}.md NOTICE
}
