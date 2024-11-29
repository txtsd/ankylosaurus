# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=opennox-bin
_pkgname="${pkgname%-bin}"
pkgver=1.9.0_alpha13
pkgrel=3
pkgdesc='A modern implementation of the Nox game engine'
arch=(x86_64)
url='https://github.com/opennox/opennox'
license=('GPL-3.0-or-later')
depends=(
  lib32-sdl2
  lib32-libglvnd
  lib32-glibc
  lib32-openal
  hicolor-icon-theme
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=(
  "${url}/releases/download/v${pkgver//_/-}/OpenNox-linux-v${pkgver//_/-}.tar.gz"
  "${url}/raw/v${pkgver//_/-}/app/io.github.noxworld_dev.OpenNox.desktop"
  "${url}/raw/v${pkgver//_/-}/app/io.github.noxworld_dev.OpenNox.HD.desktop"
  "${url}/raw/v${pkgver//_/-}/app/io.github.noxworld_dev.OpenNox.metainfo.xml"
  "${url}/raw/v${pkgver//_/-}/res/${_pkgname}_256.png"
  "${url}/raw/v${pkgver//_/-}/res/${_pkgname}_512.png"
)
sha256sums=('aea82f0dd8d41c7f3578a8b45647916604f204ceb1f2ce0204fbd7009405f838'
            'b51d66d76bf5721babef6b949d42a61a6c99b6e9f2648ccea98b1e7684b976c7'
            '88575fef50ae9898a815f45b284c21b895b68320bef53f7fafb40c96eef8a307'
            'e03d76ac59945f3aba682eab6b81db444681b10daa603d952b68edc22ce98ca1'
            'ff595a68d0cc32446c50dbc499abb7c5d7c44b8048ab37fd05b77d86dd13d8b8'
            '3028d6c6389f2afbddfee5e096e5b291817cef7ba4b435cf3571c6c691223346')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}-hd" "${pkgdir}/usr/bin/${_pkgname}-hd"
  install -Dm755 "${_pkgname}-server" "${pkgdir}/usr/bin/${_pkgname}-server"
  local fqpn="io.github.noxworld_dev.OpenNox"
  install -Dm644 "${fqpn}.desktop" "${pkgdir}/usr/share/applications/${fqpn}.desktop"
  install -Dm644 "${fqpn}.HD.desktop" "${pkgdir}/usr/share/applications/${fqpn}.HD.desktop"
  install -Dm644 "${fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${fqpn}.metainfo.xml"
  install -Dm644 "${_pkgname}_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${fqpn}.png"
  install -Dm644 "${_pkgname}_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${fqpn}.png"
}
