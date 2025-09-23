# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bionic_translation
pkgver=r107.026ea254
pkgrel=1
_commit=026ea2542258a7e0cbb52f22d7475aea68cbcbf5
pkgdesc='A set of libraries for loading bionic-linked .so files on musl/glibc'
url='https://gitlab.com/android_translation_layer/bionic_translation'
arch=(x86_64 aarch64 armv7h)
license=('MIT')
depends=(
  bubblewrap
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
sha256sums=('84883fd65c29ca8f3d9b58d0f41b594a5e85d03c00fb0eb28c84dfba3b93b0a1')

prepare() {
  meson subprojects download --sourcedir="${pkgname}-${_commit}"
}

build() {
  arch-meson "${pkgname}-${_commit}" build
  meson compile -C build
}

# check() {
#   meson test --no-rebuild --print-errorlogs -C build
# }

package() {
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
