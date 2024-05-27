# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-syncedlyrics
_pkgname=${pkgname#python-}
pkgver=0.10.0
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
sha256sums=('7b00ce6b5ab7233b0a63defc8d959f891039373752a726aec0b0e4f7f4e61830')

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
