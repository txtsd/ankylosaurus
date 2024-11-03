# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mrAppleXZ <mr.applexz@gmail.com>

pkgname=blockbench
pkgver=4.11.2
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64' 'armv7h')
url="https://blockbench.net/"
license=(GPL-3.0-or-later)
_electron=electron
depends=(
  "${_electron}"
  'giblib'
  'bash'
  'imlib2'
  'glibc'
  'libx11'
)
makedepends=(git npm)
options=(!debug)
source=("${pkgname}::git+https://github.com/JannisX11/blockbench#tag=v${pkgver}"
        "${pkgname}.desktop")
sha256sums=('5542994c559512068dc55607abbcd646fda1a936c927e507daa96ddaa53a6861'
            '2dd94f6c807fac6e83fc2176098390100f3c227285671804a855a092c0a2a2e7')

prepare() {
  cd "${srcdir}/${pkgname}"
  npm install
}

build() {
  cd "${srcdir}/${pkgname}"
  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)
  npm run dist -- --linux --x64 --dir -c.electronDist=${_electronDist} -c.electronVersion="${_electronVersion}"
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
  install "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}${_electronDist}${_electronVersionMajor}/resources/${pkgname}.asar"
  cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}${_electronDist}${_electronVersionMajor}/resources/${pkgname}.asar.unpacked"
}
