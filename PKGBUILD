# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Panagiotis Mavrogiorgos <pmav99@gmail.com>

pkgname=nuitka
pkgver=1.9.5
pkgrel=1
pkgdesc='Python compiler with full language support and CPython compatibility'
arch=(any)
url='https://nuitka.net/'
license=(Apache)
depends=(libxml2 patchelf python-appdirs python-setuptools python-wheel scons)
makedepends=(gdb python-build python-installer git)
checkdepends=(ccache fuse2 python-boto3 python-brotli strace)
optdepends=('ccache: for build caching'
            'pyside2: for using Qt5 APIs')
source=("https://nuitka.net/releases/${pkgname^}-$pkgver.tar.bz2")
sha256sums=('238b7781ec6e2cdd465409273afe045cf1d9226f75ac16fed7ce1082c8b99667')
b2sums=('eb315e08fad705179c323bb4d6695024978358b895e10c8b616220ffc367a47f15279e007a1a1c381a2238006f7fc70a8707eb5378638a816cec83c99e826f0b')

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

 cd tests

 # ./run-tests is disabled for now, see:
 # https://github.com/Nuitka/Nuitka/issues/2595
 # https://github.com/Nuitka/Nuitka/issues/2609
 #./run-tests
}

package() {
  cd ${pkgname^}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {Changelog,Developer_Manual,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# getver: github.com/Nuitka/Nuitka
