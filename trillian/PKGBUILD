# Maintainer: mwawrzyniak <mwawrzyniak@cmstactical.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mariusn <marius@softpedia.com>
# Contributor: HanFox <hanfox.co.uk>
# Contributor: Xyon <admin@jbladen.co.uk>
# Contributor: Doug Newgard <scimmia22@outlook.com>

pkgname=trillian
pkgver=6.3.0.1
_pkgver="${pkgver%????}"
pkgrel=2
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
  libpulse
  librsvg
  libsecret
  libsigc++
  libx11
  libxss
  libzip
  openssl-1.0
  pango
  pangomm
  util-linux-libs
  webkit2gtk
  zlib
)
optdepends=('libappindicator-gtk3: tray icon support')
options=(!debug)
source_x86_64=("https://www.trillian.im/get/linux/${_pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('42e3466ee236ac2644907059f0961eba3a6ed6b6156afb2c57f54ebe6065ac6f')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
