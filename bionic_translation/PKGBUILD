# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bionic_translation
pkgver=r71.104abd18
pkgrel=1
_commit=104abd180b327487970a88b0743b3509d0e455a5
pkgdesc='A set of libraries for loading bionic-linked .so files on musl/glibc'
url='https://gitlab.com/android_translation_layer/bionic_translation'
arch=(x86_64 aarch64 armv7h)
license=('MIT')
depends=(
  glibc
  libbsd
  libglvnd
  libunwind
)
makedepends=(
  elfutils
  mesa
  meson
)
source=("${pkgname}-${_commit}.tar.gz::${url}/-/archive/$_commit/${pkgname}-${_commit}.tar.gz")
sha256sums=('a6302c1d939f1b4ac986871983ccdc288b65956e182379ea8ace607b23fa487c')

prepare() {
  meson subprojects download --sourcedir="${pkgname}-${_commit}"
}

build() {
  arch-meson "${pkgname}-${_commit}" build
  meson compile -C build
}

check() {
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
