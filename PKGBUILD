# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=ttf-unifont
_pkgname="${pkgname#ttf-}"
pkgver=17.0.02
pkgrel=1
pkgdesc='TrueType version of the GNU Unifont'
url='https://unifoundry.com/unifont.html'
arch=(any)
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
makedepends=(fontforge)
provides=(emoji-font)
options=(!debug)
source=("https://unifoundry.com/pub/unifont/unifont-${pkgver}/unifont-${pkgver}.tar.gz"{,.sig})
sha256sums=('0c19e2611f0fd836966080b31b0d45921998debacd5745e2506ee0bbcbc6e528'
            'SKIP')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy

build() {
  cd "${_pkgname}-${pkgver}/font"
  # Instead of setting `MAKEFLAGS=-j1`, make the dependency first
  make hex
  make truetype
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 OFL-1.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "font/compiled/unifont-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont.ttf"
  install -Dm644 "font/compiled/unifont_jp-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_jp.ttf"
  install -Dm644 "font/compiled/unifont_upper-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_Upper.ttf"
  install -Dm644 "font/compiled/unifont_csur-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/Unifont/Unifont_CSUR.ttf"
}
