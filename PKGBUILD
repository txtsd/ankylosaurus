# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-urllib3-future
_pkgname="${pkgname/python-/}"
pkgver=2.14.908
pkgrel=1
pkgdesc='Inplace replacement for urllib3 capable of async with automatic HTTP/1, HTTP/2 and HTTP/3 transport.'
arch=('any')
url='https://github.com/jawah/urllib3.future'
license=('MIT')
depends=(
  python
  python-brotli
  python-brotlicffi
  python-h11
  python-idna
  python-jh2
  python-pyopenssl
  python-pysocks
  python-python-socks
  python-qh3
  python-typing_extensions
  python-wsproto
  python-zstandard
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
options=(!debug)
source=("${pkgname}-${pkgvr}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89fb5c48b99f00f63b532b0e8c383fe5baa751d8d20fe019907bf65de04ae14a')

build() {
  cd "${_pkgname/-/.}-${pkgver}"

  # We do not wish to conflict with the original python-urllib3
  env URLLIB3_NO_OVERRIDE=true python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname/-/.}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm0644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
