# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone-git
_pkgname=${pkgname%%-git}
pkgver=r167.57f9bbd9
pkgrel=1
pkgdesc='A standalone version of Dalvik with Art built in'
url='https://gitlab.com/android_translation_layer/art_standalone'
arch=('x86_64' 'aarch64' 'armv7h')
license=('LicenseRef-Unknown')
depends=(
  wolfssl-jni
	libbsd
	icu
	xz
	lz4
  java-runtime
	zlib
	expat
	libunwind
	openssl
	bionic_translation
  gcc-libs
  bash
  glibc
)
makedepends=(
  git
	bsd-compat-headers
	libcap
	meson
	jdk8-openjdk
	python
	valgrind
	zip
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
	make PREFIX=/usr ____LIBDIR=lib
}

package() {
  cd ${_pkgname}
	DESTDIR="$pkgdir" make \
		____PREFIX="$pkgdir"/usr \
		____INSTALL_ETC="$pkgdir"/etc \
		____LIBDIR=lib \
		install
}

