# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer
_pkgname=${pkgname//-/_}
pkgver=r651.e541d87f
pkgrel=2
_commit=e541d87fc255160ca0559015db0cc57042246fff
pkgdesc='A translation layer for running Android apps on a Linux system'
url='https://gitlab.com/android_translation_layer/android_translation_layer'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
# libopensles-standalone is not strictly required but some Android applications depend on it
depends=(
  alsa-lib
  art_standalone
  bionic_translation
  ffmpeg
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gtk4
  libglvnd
  libgudev
  libopensles-standalone
  libportal
  pango
  skia-sharp-atl
  sqlite
  vulkan-icd-loader
  webkitgtk-6.0
  cairo
  harfbuzz
  gcc-libs
  libdrm
  libsoup3
  wayland
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
options=(!strip)
source=("${pkgname}-${_commit}.tar.gz::${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('e16cf668e9b2d9c1149f16dcaa785faedfc7dc4a81e2cf62d1f0c35afbba67fa')

prepare() {
  meson subprojects download --sourcedir=${pkgname}-${_commit}
}

build() {
  arch-meson ${pkgname}-${_commit} build
  meson compile -C build
}

check() {
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  depends+=(java-runtime)
  meson install --no-rebuild -C build --destdir "${pkgdir}"
}
