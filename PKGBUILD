# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bionic_translation
pkgver=r68.e502e92
pkgrel=1
_commit=e502e9273c5fb600751f53a1d843ad38c910b2d8
pkgdesc='A set of libraries for loading bionic-linked .so files on musl/glibc'
url='https://gitlab.com/android_translation_layer/bionic_translation'
arch=('x86_64' 'aarch64' 'armv7h')
license=('MIT')
depends=(
  'libbsd'
  'libunwind'
  'libglvnd'
  'glibc'
)
makedepends=(
  'elfutils'
  'mesa'
  'meson'
)
options=(!strip)
source=("${pkgname}-${_commit}::${url}/-/archive/$_commit/${pkgname}-${_commit}.tar.gz")
sha256sums=('e8710740552f6e0124eb6ada8728cc81eb17fb937ec63ff51b1138ee903e3618')

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

