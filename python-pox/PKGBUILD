# Maintainer: greyltc
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-pox
_pkgname="${pkgname#python-}"
pkgver=0.3.5
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url='https://github.com/uqfoundation/pox'
arch=(any)
license=('BSD-3-Clause')
depends=('python>=3.8')
makedepends=('python-setuptools>=42.0' 'python-build' 'python-installer' 'python-wheel')
_src_name="${_pkgname/-/_}-${pkgver}"
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8120ee4c94e950e6e0483e050a4f0e56076e590ba0a9add19524c254bd23c2d1')

build() {
  cd "${_src_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_src_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
