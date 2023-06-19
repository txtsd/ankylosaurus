# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: seth <getchoo at tuta dot io>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=prismlauncher-qt5
pkgver=7.1
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64' 'aarch64')
url="https://prismlauncher.org"
license=('GPL3')
depends=('java-runtime=17' 'java-runtime=8' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt5' 'tomlplusplus' 'cmark')
provides=('prismlauncher')
conflicts=('prismlauncher')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'jdk17-openjdk' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/${pkgver}/PrismLauncher-${pkgver}.tar.gz")
sha256sums=('dc7aeff6e0dc12f4f2065e718418a4110ccdbad3e49fbd58e416a213fde7ebb1')

build() {
  cd "PrismLauncher-${pkgver}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="5" \
    -Bbuild -S.
  cmake --build build
}

package() {
  cd "PrismLauncher-${pkgver}/build"
  DESTDIR="${pkgdir}" cmake --install .
}
