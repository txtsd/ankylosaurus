# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname=libfm-qt
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc='Qt port of libfm, a library providing components to build desktop file managers'
arch=('i686' 'x86_64')
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('qt6-base' 'lxqt-menu-data-git' 'menu-cache' 'libexif')
optdepends=(
  'gvfs: support for the trash bin and network devices'
)
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" 'pcmanfm-qt<=0.10.0')
source=('git+https://github.com/lxqt/libfm-qt.git')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  mkdir -p build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../$_pkgname

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install

  # CMake installs empty folders unexpectedly
  # https://gitlab.kitware.com/cmake/cmake/issues/17122
  rmdir "$pkgdir"/usr/include/libfm-qt6/{tests,translations}
}
