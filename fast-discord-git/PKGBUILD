# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Relwi <theofficialdork@hotmail.com>

pkgname=fast-discord-git
pkgver=r233.651f323
pkgrel=3
pkgdesc='A new Discord client made in C++ and Qt'
arch=(i686 x86_64 aarch64)
url='https://github.com/EnyoYoen/Fast-Discord'
license=('MIT')
depends=(
  gcc-libs
  glibc
  libsodium
  opus
  qt5-base
  qt5-multimedia
  qt5-websockets
)
makedepends=(cmake git)
source=("${pkgname}::git+https://github.com/EnyoYoen/Fast-Discord")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname}"

  sed -i 's/cmake_minimum_required(VERSION 3.1.0)/cmake_minimum_required(VERSION 4.0.0)/' CMakeLists.txt
}

build() {
  cd "${pkgname}"

  cmake -S . -B bin \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build bin
}

check() {
  cd "${pkgname}"

  ctest --test-dir bin --output-on-failure
}

package() {
  cd "${pkgname}"

  install -Dm755 bin/Fast-Discord "${pkgdir}/usr/bin/fast-discord"
  install -Dm644 resources/com.enyoyoen.fast-discord.desktop "${pkgdir}/usr/share/applications/com.enyoyoen.fast-discord.desktop"
  install -Dm644 doc/images/Fast-Discord-Logo.png "${pkgdir}/usr/share/pixmaps/fast-discord.png"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
