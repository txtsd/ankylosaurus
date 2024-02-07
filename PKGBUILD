# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=2.0
pkgrel=1
pkgdesc='Python compiler with full language support and CPython compatibility'
arch=(any)
url='https://nuitka.net/'
license=(Apache-2.0)
depends=(libxml2 patchelf python-appdirs python-setuptools python-wheel scons)
makedepends=(gdb python-build python-installer git)
checkdepends=(ccache fuse2 python-boto3 python-brotli strace)
optdepends=('ccache: for caching builds'
            'pyside2: for using Qt5 APIs'
            'patchelf: for using standalone mode')
source=("https://nuitka.net/releases/${pkgname^}-$pkgver.tar.bz2")
sha256sums=('2ebf9239a441316336cfe5f9b1b365098cd29f2467d8801992d35f866c4a168f')
b2sums=('78dd4a1a5f04681546f2bf9ee3769f0ce5ce658dc13960223f235ec3fe019a600274f14443fd34601ac7bf838651515961d5eb18602b6005c1e2900afca874f2')

build() {
  cd ${pkgname^}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
 cd ${pkgname^}-$pkgver

 # Check that compilation works
 echo 'print("Compiling main.py to an executable and then running it works")' > main.py
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
