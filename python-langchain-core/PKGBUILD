# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-core
_pkgname=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
url='https://github.com/langchain-ai/langchain'
depends=(python
    python-anyio
    python-jsonpatch
    python-langsmith
    python-packaging
    python-pydantic
    python-yaml
    python-requests
    python-tenacity
    python-jinja
    python-typing_extensions
    python-defusedxml
    python-numpy)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
_src_name="${_pkgname%%-*}-${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/langchain-core==${pkgver}.tar.gz")
sha256sums=('8e3adcd650ece0f0cfdfa11870a2711039bcc55a42f394da89f7ec957a9ae470')

build() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_src_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
