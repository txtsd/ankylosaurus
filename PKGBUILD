# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=2.3
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
b2sums=('f6f7346e8f898a8b62284c5b1f721d540fb44f41a026f8aa8025e626b57485af7467a678a2b1580439b5e24123d95e98d16c8f91f5742ad6a5fd48671a98c559')

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
