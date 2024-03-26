# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=2.1.3
pkgrel=1
pkgdesc='Python compiler with full language support and CPython compatibility'
arch=(any)
url='https://nuitka.net'
license=(Apache-2.0)
depends=(libxml2 patchelf python-appdirs python-setuptools python-wheel scons)
makedepends=(gdb python-build python-installer git)
checkdepends=(ccache fuse2 python-boto3 python-brotli strace)
optdepends=('ccache: for caching builds'
            'pyside2: for using Qt5 APIs'
            'patchelf: for using standalone mode')
source=("$url/releases/${pkgname^}-$pkgver.tar.bz2")
sha256sums=('ef9cfa7803a181f5bf41294c3c829489ab5152d8ac779704077587ef2d5a49c7')
b2sums=('6e9ec660549cbe883fb9f9904b33373073749d50ee732715da193aed07f38c837e6f4b9bb0c51df51ce85b76bcfe956e9290cd1b46b13a0906485efe2309d366')

build() {
  cd ${pkgname^}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname^}-$pkgver

  # Check that compilation works
  echo 'print("[x] Can compile main.py to an executable.\n[x] Can run the resulting executable.")' > main.py
  bin/nuitka --output-filename=main --lto=yes --show-scons main.py
  ./main

  # Tests are disabled for now. See:
  # https://github.com/Nuitka/Nuitka/issues/2595
  # https://github.com/Nuitka/Nuitka/issues/2609
  #cd tests
  #./run-tests
}

package() {
  cd ${pkgname^}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,Developer_Manual,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
