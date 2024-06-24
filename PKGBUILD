# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-pykakasi
pkgver=2.3.0
pkgrel=2
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url='https://codeberg.org/miurahr/pykakasi'
license=(GPL-3.0-or-later)
depends=(
    python-deprecated
    python-jaconv
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-scm
    python-sphinx
    python-wheel
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('81cc3b366c61a552e7de5a2a900a258ad0847d6a0f60dff0ebd20c77ed6fce3604e72634901dc11041f46dbe437c83f25db617f7d74df732f4ade7e4983c10cd')

build() {
  cd pykakasi
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd pykakasi
  python -m installer --destdir="$pkgdir" dist/*.whl

  # rename script in /usr/bin to pykakasi in order to avoid conflicts with the kakasi package
  mv "$pkgdir"/usr/bin/{,py}kakasi

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/*
}
