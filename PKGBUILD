# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-text-splitters
_pkgname=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
url='https://github.com/langchain-ai/langchain'
depends=(python
    python-tiktoken
    python-requests
    python-lxml
    python-langchain-core
    python-beautifulsoup4)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
_src_name="${_pkgname%%-*}-${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/langchain-text-splitters==${pkgver}.tar.gz")
sha256sums=('77d4d69f540d41223bf3fed9fcc195e6c144db6972462a1c8a5443ff84c802bd')

build() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_src_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
