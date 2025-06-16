# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=illarion-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0.48
pkgrel=1
pkgdesc='The Illarion Launcher that is used to download the actual game and start it'
arch=(x86_64)
url='https://illarion.org'
license=('GPL-3.0-or-later')
depends=(
  bash
  freetype2
  gcc-libs
  glib2
  glibc
  java-runtime
)
provides=("${_pkgname}")
options=(!strip)
source=(
  "https://${_pkgname}.org/media/java/install/${_pkgname}-${pkgver}-amd64.deb"
  "${_pkgname}.desktop"
)
sha256sums=('b5e1633397d40cab2c5e19dbe17fb653a55bd8aa8f3c6c119bc2d88193f4d5d5'
            '9f3a8e6c3224a98d203307a30fc622f35d22bf5ada4a64634307d634ec4f5f8a')

package() {
  tar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"
  rm -rf "${pkgdir}/opt/${_pkgname}/bin"
  rm -rf "${pkgdir}/opt/${_pkgname}/jre/lib/applet"

  cd "${pkgdir}"

  install -dm755 "usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/.install4j/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
