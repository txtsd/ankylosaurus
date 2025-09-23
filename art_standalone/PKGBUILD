# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone
pkgver=r213.35696d99
pkgrel=2
_commit=35696d993a60434622f44b68ab4d882836683a73
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
  libpng
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
sha256sums=('5edd26e9bf9d687b8092e06ed948c59c0d00282fe199a5773dddffc71c4019d6')

build() {
  cd "${pkgname}-${_commit}"

  make ____PREFIX=/usr ____LIBDIR=lib
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
