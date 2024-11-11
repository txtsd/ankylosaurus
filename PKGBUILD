# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone
pkgver=r173.82eb7bca
pkgrel=1
_commit=82eb7bca2dd82b92f3be6a9fbd93dc757c85a77a
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
sha256sums=('c235c0bca9151a7c79643a89765cef8ebe97659e0dbd3d348601ed4b15b9e41f')

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
