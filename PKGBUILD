# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=2.4
pkgrel=1
pkgdesc='Python compiler with full language support and CPython compatibility'
arch=(any)
url='https://nuitka.net'
license=(Apache-2.0)
depends=(libxml2 patchelf python python-appdirs 'python-setuptools>=42.0' python-wheel scons)
makedepends=(gdb git python-build python-installer)
checkdepends=(ccache fuse2 python-boto3 python-brotli strace)
optdepends=('ccache: for caching builds')
source=("$url/releases/${pkgname^}-$pkgver.tar.bz2")
b2sums=('04824cb7fe0551bba2480d3b0e2478022a068a2a96b10cb906dd3c042fdb11df76e95ecfcc0ed2e783ac194e69dd47352d282a068416e49abde16292c09ff1bd')

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
  # cd tests
  # ./run-tests
}

package() {
  cd ${pkgname^}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,Developer_Manual,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
