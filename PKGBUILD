# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=android_translation_layer
_pkgname=${pkgname//-/_}
pkgver=r674.332d3d11
pkgrel=1
_commit=332d3d1137b6dbae579583b8fb8cb607795b925a
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
sha256sums=('ffb1f31e41b7ce48830b7757b0c2eea97f93ea25a81ee24ff04e40f9b37d83d4')

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
