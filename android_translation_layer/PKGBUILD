# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer
_pkgname=${pkgname//-/_}
pkgver=r739.7aea3a69
pkgrel=1
_commit=7aea3a6920f0731f5d9f7af37bfbae51d8477af3
pkgdesc='A translation layer for running Android apps on a Linux system'
url='https://gitlab.com/android_translation_layer/android_translation_layer'
arch=(x86_64 aarch64 armv7h)
license=('GPL-3.0-or-later')
# libopensles-standalone is not strictly required but some Android applications depend on it
depends=(
  alsa-lib
  art_standalone
  bionic_translation
  cairo
  ffmpeg
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gtk4
  harfbuzz
  libdrm
  libglvnd
  libgudev
  libopensles-standalone
  libportal
  libsoup3
  pango
  skia-sharp-atl
  sqlite
  vulkan-icd-loader
  wayland
  webkitgtk-6.0
)
makedepends=(
  glib2-devel
  java-runtime-common
  jdk8-openjdk
  meson
  openxr
  vulkan-headers
  wayland-protocols
)
source=("${pkgname}-${_commit}.tar.gz::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('338dc89d324b84af20552362dd77e6b06acb1db2fbb77138d616c673c8259256')

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
  depends+=(java-runtime)
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
