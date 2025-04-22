# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: seth <getchoo at tuta dot io>

pkgname=prismlauncher-qt5-bin
_pkgname="${pkgname%-bin}"
__pkgname="${_pkgname%-qt5}"
pkgver=9.4
pkgrel=1
pkgdesc='Minecraft launcher with ability to manage multiple instances'
arch=(x86_64)
url="https://prismlauncher.org"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  bash
  bzip2
  dbus
  fontconfig
  freetype2
  gcc-libs
  glib2
  glibc
  hicolor-icon-theme
  java-runtime=17
  libxext
  libgl
  libx11
  libxcb
  libxkbcommon
  libxkbcommon-x11
  libxrender
  qt5-base
  qt5-imageformats
  qt5-svg
  wayland
  zlib
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'java-runtime=8: support for Minecraft versions < 1.17'
  'flite: minecraft voice narration'
)
provides=("${__pkgname}" "${_pkgname}")
conflicts=("${__pkgname}" "${_pkgname}")
source=(
  "https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-Linux-Qt5-Portable-${pkgver}.tar.gz"
  {lionshead,batch,mdi}.license
  prismlauncher.tmpfiles
)
noextract=("PrismLauncher-Linux-Qt5-Portable-${pkgver}.tar.gz")
sha256sums=('1830ff68458c400d67c272af406a977d9eb21bb92055dca9e29f69948e335015'
            '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770'
            '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c'
            '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6'
            'ce690bced74a0f40751dae96f9597f762355ce4792b5743d903f9602a071e0c1')

package() {
  install -dm777 "${pkgdir}/opt/${__pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  tar -C "${pkgdir}/opt/${__pkgname}" -xvf PrismLauncher-Linux-Qt5-Portable-${pkgver}.tar.gz
  rm "${pkgdir}"/opt/${__pkgname}/bin/prismlauncher_updater
  rm "${pkgdir}"/opt/${__pkgname}/manifest.txt
  rm "${pkgdir}"/opt/${__pkgname}/portable.txt
  ln -s "/opt/${__pkgname}/PrismLauncher" "${pkgdir}/usr/bin/prismlauncher"

  # licenses
  install -Dm644 lionshead.license -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 batch.license -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 mdi.license -t "${pkgdir}"/usr/share/licenses/${pkgname}

  install -Dm644 prismlauncher.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/prismlauncher.conf

  # Files are not owned by root
  chown -R root:root "${pkgdir}/opt/${__pkgname}"
}
