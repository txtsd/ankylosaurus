# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
_pkgname=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc='Get an LRC format (synchronized) lyrics for your music'
arch=('any')
url='https://github.com/moehmeni/syncedlyrics'
license=('MIT')
depends=('python>=3.8' 'python-requests>=2.28.1' 'python-rapidfuzz>=2.13.2'
        'python-beautifulsoup4>=4.11.1')
makedepends=('python-build' 'python-installer' 'python-wheel'
            'python-poetry-core')
checkdepends=('python-pytest')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c1f48472c09722537aa83473e555ca0b4454675e744f161b0e8ddbcc73805fb')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest tests.py
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
