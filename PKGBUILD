# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: esrh - https://esrh.me

pkgname=dissent-bin
_pkgname="${pkgname%-bin}"
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.35
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=(x86_64 aarch64)
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=(
  'gtk4>=4.10.3'
  'libadwaita>=1.3.2'
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gobject-introspection
  graphene
  gtksourceview5
  harfbuzz
  hicolor-icon-theme
  libgirepository
  libspelling
  pango
  vulkan-icd-loader
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("dissent-linux-amd64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64.tar.zst")
source_aarch64=("dissent-linux-arm64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64.tar.zst")
sha256sums_x86_64=('f92442c4d5e06d84a9af7bc48f1a6ada009846b594704e60d2670268b144cdaa')
sha256sums_aarch64=('bcc11e05235f31ca7078ea380b511182d2b7a56cbe329e184e2ff46c658498f4')

package() {
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr "share" "${pkgdir}/usr/"
}
