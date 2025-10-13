# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=blockbench
pkgver=5.0.0
pkgrel=1
pkgdesc='A low-poly 3D model editor'
arch=(x86_64 armv7h)
url='https://blockbench.net'
license=(GPL-3.0-or-later)
_electron=electron
depends=(
  "${_electron}"
  bash
  giblib
  glibc
  imlib2
  libx11
)
makedepends=(git npm)
options=(!debug)
source=(
  "${pkgname}::git+https://github.com/JannisX11/blockbench#tag=v${pkgver}"
  "${pkgname}.desktop"
  "https://github.com/JannisX11/blockbench/commit/1028ad4d46e8d2794d821f1e9626089d82ef915f.patch"
)
sha256sums=('1c67487f066fd3bcc67d6574bc24b2705f2a7adcf50c4be67d0201db0394d49d'
            '5a64727fcf696b3497190d441556322b4d0ffb70f560ba8eba6ef79ac5c36e8c'
            'c156200c465a43b595f4f2d38e1e6a59dfd8e7e9521175f2196e41e3ad1c942e')

prepare() {
  cd "${pkgname}"

  patch -Np1 -i "${srcdir}/1028ad4d46e8d2794d821f1e9626089d82ef915f.patch"

  npm install
}

build() {
  cd "${pkgname}"

  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)

  npm run publish-linux -- --linux --x64 --dir -c.electronDist=${_electronDist} -c.electronVersion="${_electronVersion}"
}

package() {
  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)
  _electronVersionMajor=${_electronVersion%%.*}
  _electronDir=${_electronDist}${_electronVersionMajor}

  install -d "${pkgdir}/usr/"{bin,share/{pixmaps,applications}}
  install -d "${pkgdir}/${_electronDist}${_electronVersionMajor}/resources"

  echo -e "#!/bin/bash\nexec ${_electron} ${_electronDist}${_electronVersionMajor}/resources/${pkgname}.asar \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  install "${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install "${pkgname}/dist-electron/linux-unpacked/resources/app.asar" "${pkgdir}${_electronDist}${_electronVersionMajor}/resources/${pkgname}.asar"

  cp -r "${pkgname}/dist-electron/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}${_electronDist}${_electronVersionMajor}/resources/${pkgname}.asar.unpacked"
}
