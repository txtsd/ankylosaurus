# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributpr: librewish <librewish@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=lxqt_wallet-git
_pkgname="${pkgname%-git}"
pkgver=4.0.2.r0.gda39cb3
pkgrel=2
pkgdesc='Secure information storage for LXQt'
arch=(x86_64)
url='https://github.com/lxqt/lxqt_wallet'
license=('BSD-2-Clause')
depends=(
  gcc-libs
  glib2
  glibc
  libgcrypt
  libglvnd
  qt6-base
)
makedepends=(
  cmake
  git
  kwallet
  libsecret
  qt6-tools
)
optdepends=(
  'libsecret: support for Gnome libsecret password storage'
  'kwallet: support for KDE wallet storage'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tag 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${_pkgname}"

  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -DNOSECRETSUPPORT=false \
    -DNOKDESUPPORT=false \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${_pkgname}"

  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
