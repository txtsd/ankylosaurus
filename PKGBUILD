# Maintainer: mwawrzyniak <mwawrzyniak@cmstactical.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mariusn <marius@softpedia.com>
# Contributor: HanFox <hanfox.co.uk>
# Contributor: Xyon <admin@jbladen.co.uk>
# Contributor: Doug Newgard <scimmia22@outlook.com>

pkgname=trillian
pkgver=6.3.0.2
_pkgver="${pkgver%????}"
pkgrel=1
pkgdesc='A commercial, multi-protocol and cross-platform IM client'
arch=(x86_64)
url='https://trillian.im'
license=('LicenseRef-proprietary')
depends=(
  atkmm
  cairo
  cairomm
  expat
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  glibmm
  gtk3
  gtkmm3
  hicolor-icon-theme
  libnotify
  libsecret
  libsigc++
  libx11
  libxss
  openssl-1.1
  pango
  pangomm
  util-linux-libs
  wayland
  zlib
)
optdepends=('libappindicator-gtk3: tray icon support')
options=(!debug)
source=("https://www.trillian.im/get/linux/${_pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('e50bef02577d202fba0c0595b324fa068c8ac7ed16500f940bcab54419f08ea8')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
