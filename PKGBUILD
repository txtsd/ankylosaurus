# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bionic_translation-git
_pkgname=${pkgname%%-git}
pkgver=r68.e502e92
pkgrel=1
_commit="8b324301f4ba3f634b479d608eec2df2d1667757"
pkgdesc='A set of libraries for loading bionic-linked .so files on musl/glibc'
url='https://gitlab.com/android_translation_layer/bionic_translation'
arch=('x86_64' 'aarch64' 'armv7h')
license=('LicenseRef-Unknown')
depends=(
	'libbsd'
	'libunwind'
  'libglvnd'
  'glibc'
)
makedepends=(
  'git'
	'elfutils'
	'mesa'
	'meson'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  meson subprojects download --sourcedir=${_pkgname}
}

build() {
  arch-meson ${_pkgname} build
	meson compile -C build
}

check() {
	meson test --no-rebuild --print-errorlogs -C build
}

package() {
	meson install --no-rebuild -C build --destdir "${pkgdir}"
}

