# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-niquests
_pkgname="${pkgname/python-/}"
pkgver=3.16.1
pkgrel=1
pkgdesc='Drop-in replacement for Requests. Automatic HTTP/1.1, HTTP/2, and HTTP/3. WebSocket, and SSE included.'
arch=('any')
url='https://github.com/jawah/niquests'
license=('Apache-2.0')
depends=(
  python
  python-certifi
  python-charset-normalizer
  python-urllib3-future
  python-wassima
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  'python-orjson: for speedups'
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('20de7391e51f579d0e0cb4a166429117a4ef89a7bb37c20f13a38abf5370b45a')

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./*.md
}
