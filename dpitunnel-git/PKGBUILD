# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dpitunnel-git
_pkgname="${pkgname%-git}"
__pkgname=DPITunnel
pkgver=1.0.3.r2.gaa098e8
pkgrel=1
pkgdesc='Free, simple and serverless solution against censorship for Linux PCs and routers'
arch=(x86_64 i686 armv7h aarch64)
url='https://github.com/txtsd/DPITunnel'
license=('GPL-3.0-or-later')
depends=(
  brotli
  ca-certificates-utils
  gcc-libs
  glibc
  libnl
  openssl
  zlib
)
makedepends=(
  cmake
  cpp-httplib
  git
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${__pkgname}"

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${__pkgname}"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
  cd "${__pkgname}"

  ctest --test-dir build --output-on-failure
}

package() {
  cd "${__pkgname}"

  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
