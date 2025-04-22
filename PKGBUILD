# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: seth <getchoo at tuta dot io>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=prismlauncher-qt5
_pkgname="${pkgname%-qt5}"
pkgver=9.4
pkgrel=1
pkgdesc='Minecraft launcher with ability to manage multiple instances'
arch=(i686 x86_64 aarch64)
url='https://prismlauncher.org'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  cmark
  hicolor-icon-theme
  java-runtime=17
  libgl
  qt5-base
  qt5-imageformats
  qt5-networkauth
  qt5-svg
  quazip-qt5
  tomlplusplus
  zlib
)
makedepends=(
  cmake
  extra-cmake-modules
  gamemode
  ghc-filesystem
  git
  jdk17-openjdk
  scdoc
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'java-runtime=8: for older minecraft versions'
  'flite: minecraft voice narration'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-${pkgver}.tar.gz"
  {lionshead,batch,mdi}.license
)
sha256sums=('77ab52239c2a2a9f77d7c4607e1d9cf40970f9240d2f5061b116a7b1b8fd0277'
            '2ee3ba8d96e9882150783b6444651ea4a65d779532ecac8646f2ecd3a48c2770'
            '009e25d32aab6dbae193aac4b82fa1a26cb07f288225b2906da425a0f219bc4c'
            '32646946afc31ef5a4ce2cbb5a5a68a9f552c540a78ef23344c51c3efca58fa6')

build() {
  cd "PrismLauncher-${pkgver}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="5" \
    -Wno-dev
  cmake --build build
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  cd "PrismLauncher-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build
}
