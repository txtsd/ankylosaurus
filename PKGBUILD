# Maintainer: Atakku <atakkudev@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=blockbench-git
pkgver=v4.10.0.r1.gbae176fa
pkgrel=1
pkgdesc="A low-poly 3D model editor (git version)"
arch=('x86_64' 'aarch64')
url=https://github.com/JannisX11/blockbench
license=('GPL-3.0-or-later')
provides=(blockbench)
conflicts=(blockbench)

_pkgname=blockbench
_electron=electron29

depends=("${_electron}" 'giblib' 'libx11' 'imlib2' 'bash' 'glibc')
makedepends=(git npm)
source=("${_pkgname}::git+https://github.com/JannisX11/blockbench.git"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '74731a9f68dbef112c93dafee1a1a8665b9de0816f94643169419ad838dbf66c')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  npm install
}

build() {
  cd "${srcdir}/${_pkgname}"
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
  echo -e "#!/bin/bash\nexec ${_electron} ${_electronDist}/resources/${_pkgname}.asar \"\$@\"" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  install "${srcdir}/${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar" "${pkgdir}${_electronDist}/resources/${_pkgname}.asar"
  cp -r "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}${_electronDist}/resources/${_pkgname}.asar.unpacked"
}
