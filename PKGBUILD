# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
pkgver=4.10.3
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64')
url="https://blockbench.net/"
license=(GPL-3.0-or-later)
provides=(blockbench)
conflicts=(blockbench)

_electron=electron29

depends=("${_electron}" 'giblib' 'bash' 'imlib2' 'glibc' 'libx11')
makedepends=(git npm)
source=("${pkgname}::git+https://github.com/JannisX11/blockbench#tag=v${pkgver}"
        "${pkgname}.desktop")
sha256sums=('eb4696a4d86dd128217155cd66286bb447f4fdd87a5b342c48611e4daf5809ad'
            '74731a9f68dbef112c93dafee1a1a8665b9de0816f94643169419ad838dbf66c')

prepare() {
  cd "${srcdir}/${pkgname}"
  npm install
}

build() {
  cd "${srcdir}/${pkgname}"
  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)
  npm run dist -- --linux --x64 --dir -c.electronDist=${_electronDist} -c.electronVersion=${_electronVersion}
}

package() {
  _electronDist=/usr/lib/${_electron}
  _electronVersion=$(cat ${_electronDist}/version)
  _electronVersionMajor=${_electronVersion%%.*}
  _electronDir=${_electronDist}${_electronVersionMajor}
  install -d "${pkgdir}/usr/"{bin,share/{pixmaps,applications}}
  install -d "${pkgdir}${_electronDist}/resources"
  echo -e "#!/bin/bash\nexec ${_electron} ${_electronDist}/resources/${pkgname}.asar \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  install "${srcdir}/${pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}${_electronDist}/resources/${pkgname}.asar"
  cp -r "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}${_electronDist}/resources/${pkgname}.asar.unpacked"
}
