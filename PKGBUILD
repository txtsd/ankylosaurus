# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone
pkgver=r167.57f9bbd9
pkgrel=1
_commit=57f9bbd9417b67a6d7bf70a7d7d457fc894250f5
pkgdesc='A standalone version of Dalvik with Art built in'
url='https://gitlab.com/android_translation_layer/art_standalone'
arch=('x86_64' 'aarch64' 'armv7h')
license=('Apache-2.0')
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
  bsd-compat-headers
  libcap
  meson
  jdk8-openjdk
  python
  valgrind
  zip
)
options=(!strip)
source=("${pkgname}-${_commit}::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('9ab978af34adfaecf190f790bc2b2da17f8579f6a41ca2677bac6c14c3d718f8')

build() {
  cd "${pkgname}-${_commit}"
  make PREFIX=/usr ____LIBDIR=lib
}

package() {
  cd "${pkgname}-${_commit}"
  DESTDIR="$pkgdir" make \
    ____PREFIX="$pkgdir"/usr \
    ____INSTALL_ETC="$pkgdir"/etc \
    ____LIBDIR=lib \
    install
}
