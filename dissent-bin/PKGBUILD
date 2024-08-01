# Maintainer: esrh - https://esrh.me
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-bin
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.26
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
    'vulkan-icd-loader')

sha256sums_x86_64=('82f5b92892cc96d8d89ccd42a093423492087e88bfb1364c30002af6227a7c6d')
sha256sums_aarch64=('e4c458b30ff0fb53a09db64ec7af42590bba499e6209e66e4bd7f8d8af04f702')
source_x86_64=("dissent-linux-amd64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64.tar.zst")
source_aarch64=("dissent-linux-arm64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64.tar.zst")

package() {
    install -Dm 755 "${srcdir}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/share/" "${pkgdir}/usr/"
}
