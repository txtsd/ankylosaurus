# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Batuhan Baserdem <last.first@gmail.com>

pkgname=scientifica-font
_pkgname="${pkgname%-font}"
pkgver=2.3
pkgrel=2
pkgdesc='Tall and condensed bitmap font for geeks.'
url="https://github.com/NerdyPepper/${_pkgname}"
license=('OFL-1.1')
arch=('any')
conflicts=(
  "${_pkgname}-ttf"
  "${_pkgname}-otb"
  "ttf-${_pkgname}"
  "otb-${_pkgname}"
)
provides=(
  "ttf-${_pkgname}"
  "otb-${_pkgname}"
)
options=(!debug)
source=(
  "${_pkgname}.tar::${url}/releases/download/v${pkgver}/${_pkgname}.tar"
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('f0857869a0e846c6f175dcb853dd1f119ea17a75218e63b7f0736d5a8e1e8a7f'
            '00ab57863c3004c5e2148426ef87649cffe66ed240a49b82243ca8916a2da096')
package() {
  # Install the TrueType fonts
  install -D --mode=644 "${srcdir}/${_pkgname}/ttf/${name}"*.ttf --target-directory "${pkgdir}/usr/share/fonts/TTF"
  # Install the OpenType bitmap fonts
  install -D --mode=644 "${srcdir}/${_pkgname}/otb/${name}"*.otb --target-directory "${pkgdir}/usr/share/fonts/misc"
  # Install the license
  install -D --mode=644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
