# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=2.5.6
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
b2sums=('34829bb6c056e8c539a59d56faa86373b291f60d8b9e15b306b63260110e0eeac262ace7cd0f6ab567ba672d4cdbbc10a8dbb97a11ad457a1774e086138afbc0')

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
