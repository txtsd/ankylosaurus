# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=art_standalone
pkgver=r168.ce8fe1f0
pkgrel=1
_commit=ce8fe1f089320a0d83c303661db4d2100119b053
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
sha256sums=('d51551ccd827066a4ca8fc0656f7b01ebdf9cea081a99768c3a54ff84229b22b')

build() {
  cd "${pkgname}-${_commit}"
  make PREFIX=/usr ____LIBDIR=lib
}

package() {
  depends+=(java-runtime)
  cd "${pkgname}-${_commit}"
  DESTDIR="$pkgdir" make \
    ____PREFIX="$pkgdir"/usr \
    ____INSTALL_ETC="$pkgdir"/etc \
    ____LIBDIR=lib \
    install
}
