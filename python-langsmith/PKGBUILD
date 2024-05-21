# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langsmith
_pkgname=${pkgname#python-}
pkgver=0.1.60
pkgrel=1
pkgdesc='LangSmith Client SDK Implementations'
arch=('any')
url="https://github.com/langchain-ai/langsmith-sdk"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4b28e342feeef5320aca13d64a6fb1dddf745230f0e67608a1745a8be7a1ada1')
depends=(python python-pydantic python-requests python-openai python-orjson
    python-pandas python-psutil python-typing_extensions python-urllib3
    python-rapidfuzz python-tqdm python-numpy)
makedepends=(python-build python-installer python-wheel python-poetry-core)

build() {
    cd "${_pkgname}-sdk-${pkgver}/python"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-sdk-${pkgver}/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_pkgname}-sdk-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
