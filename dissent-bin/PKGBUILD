# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-bin
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.29
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
provides=('dissent')
conflicts=('dissent' 'dissent-git')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2'
    'libgirepository' 'harfbuzz' 'glib2' 'graphene' 'cairo'
    'hicolor-icon-theme' 'pango' 'glibc' 'gdk-pixbuf2' 'gcc-libs'
    'vulkan-icd-loader' 'libspelling' 'gtksourceview5')

sha256sums_x86_64=('03aa6b4c4ae029a9aafc573c5034f482a9235f8f43da375ca491a41aa27df6b5')
sha256sums_aarch64=('10a6916563dd82c1cd5bc85485377b28beebd1ab7752abda219dfdaf096e8076')
source_x86_64=("dissent-linux-amd64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64.tar.zst")
source_aarch64=("dissent-linux-arm64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/share/" "${pkgdir}/usr/"
}
