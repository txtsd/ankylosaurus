# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-core
_pkgname=${pkgname#python-}
pkgver=0.1.52
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
    python-defusedxml)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
license=('MIT')
arch=('any')
_src_name="${_pkgname%%-*}-${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/langchain-core==${pkgver}.tar.gz")
sha256sums=('6ee62ad7c8ce418e443f50dcf32ae61dd170a11a219a994173d872b0022872c2')

build() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_src_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
