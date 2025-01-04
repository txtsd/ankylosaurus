# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone
pkgver=r184.1f3e7592
pkgrel=1
_commit=1f3e7592da072900ebba6f045541600b26c17907
pkgdesc='A standalone version of Dalvik with Art built in'
url='https://gitlab.com/android_translation_layer/art_standalone'
arch=(x86_64 aarch64 armv7h)
license=('Apache-2.0')
depends=(
  bash
  bionic_translation
  expat
  gcc-libs
  glibc
  icu
  libbsd
  libunwind
  lz4
  openssl
  wolfssl-jni
  xz
  zlib
)
makedepends=(
  bsd-compat-headers
  jdk8-openjdk
  libcap
  meson
  python
  valgrind
  zip
)
source=("${pkgname}-${_commit}.tar.gz::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('2bc769022e5671de19b0cf19450eb08553bb11a74a687149bbedb1066b86dfc0')

build() {
  cd "${pkgname}-${_commit}"

  make PREFIX=/usr ____LIBDIR=lib
}

package() {
  depends+=(java-runtime)

  cd "${pkgname}-${_commit}"

  DESTDIR="${pkgdir}" make \
    ____PREFIX="${pkgdir}/usr" \
    ____INSTALL_ETC="${pkgdir}/etc" \
    ____LIBDIR=lib \
    install
}
