# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: esrh - https://esrh.me

pkgname=dissent-bin
_pkgname="${pkgname%-bin}"
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.30
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
sha256sums_x86_64=('e9b65ab2ed920f65fc051a6a9d9e266ae14d6c96f49f2404cc3625e9ee6076a3')
sha256sums_aarch64=('e8ea4594f45d39bc93be4ea6f24cd92756d35a5c1f98a0fbbb2bde7f5beb1795')

package() {
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr "share" "${pkgdir}/usr/"
}
