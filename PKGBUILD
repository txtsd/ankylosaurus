# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

pkgname=python-pykakasi
pkgver=2.2.1
pkgrel=8
pkgdesc="Lightweight converter from Japanese Kana-kanji sentences into Kana-Roman"
arch=(any)
url='https://codeberg.org/miurahr/pykakasi'
license=(GPL-3.0-or-later)
depends=(
    python-deprecated
    python-jaconv
    python-setuptools
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools-scm
    python-sphinx
    python-wheel
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('0f8dd935056cd2646722b130009504ef9c60b9cc962395e33c3163be4ee47ff4d126d3faf8ff22950fa9bb98efea8f1572027726970da4c66e5401aee898c64c')

prepare() {
  # remove build-time dependency on python-klepto
  git -C pykakasi cherry-pick -n 110e85e6c20920ce196931269ca6642f2cda6f21
}

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
