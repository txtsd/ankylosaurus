# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-isocodes
_pkgname=${pkgname#python-}
pkgver=2025.8.25
pkgrel=1
pkgdesc="Provides lists of various ISO standards (e.g. country, language, language scripts, and currency names) in one place"
arch=('any')
url="https://github.com/Atem18/isocodes"
license=('MIT')
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f88335ca770888dbd730d74e22163c427ad1744049c5c8027c3f532eb95ecfec')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
