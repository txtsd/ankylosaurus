# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-user_agent2
_pkgname="${pkgname#python-}"
pkgver=2021.12.11
pkgrel=1
pkgdesc='Generate random user agents'
url='https://pypi.org/project/user-agent2/'
arch=(any)
license=('MIT')
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(
  python
  python-beautifulsoup4
  python-requests
  python-user_agent
)
optdepends=()
_src_name="${_pkgname//-/_/}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_src_name}.tar.gz")
sha256sums=('3a7c94a6cba52597bfca2bfd649aa690a7ae56db0884aeb19152dbfea670a987')

build() {
  cd "${_src_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_src_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
