# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=qcomix
pkgver=1.0b7
pkgrel=1
pkgdesc='Qt-based comic viewer'
arch=(i686 x86_64)
license=(GPL-3.0-or-later)
url='https://gitgud.io/qcomix/qcomix'
depends=(
  gcc-libs
  glibc
  qt6-base
  qt6-multimedia
  quazip-qt6
)
makedepends=(
  cmake
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0811792de09a357a9374a8e0c05d1c9683eb77d73953cfd7fef999365c6849d1')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/qcomix.png"
  install -Dm644 "qcomix.desktop" "${pkgdir}/usr/share/applications/qcomix.desktop"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
