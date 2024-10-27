# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributpr: librewish <librewish@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=lxqt_wallet-git
_pkgname=${pkgname%%-git}
pkgver=4.0.0.r0.gd685689
pkgrel=1
pkgdesc='Secure information storage for LXQt'
arch=('x86_64')
url='https://github.com/lxqt/lxqt_wallet'
license=('BSD-2-Clause')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'libgcrypt'
  'qt6-base'
)
makedepends=(
  'git'
  'cmake'
  'kwallet'
  'libsecret'
  'qt6-tools'
)
optdepends=(
  'libsecret: support for Gnome libsecret password storage'
  'kwallet: support for KDE wallet storage'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${_pkgname}"


  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release  \
    -DNOSECRETSUPPORT=false \
    -DNOKDESUPPORT=false \
    -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${_pkgname}"

  cmake --build build
}

package() {
    cd "${_pkgname}"

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
