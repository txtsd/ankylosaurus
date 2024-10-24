# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributpr: librewish <librewish@gmail.com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=lxqt_wallet-git
_pkgname=${pkgname%%-git}
pkgver=3.2.2.r26.gcf7120f
pkgrel=1
pkgdesc="Secure information storage for LXQt"
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
source=(
  "git+https://github.com/lxqt/${_pkgname}.git"
  '0001-fixes.patch'
)
sha256sums=('SKIP'
            'bc7fe8c0283333d456672e34b1776c6553aaaec431d9191d3abc1e682fe3fa83')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${_pkgname}"

  patch -Np1 -i "${srcdir}/0001-fixes.patch"

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
