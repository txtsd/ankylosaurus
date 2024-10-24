# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Faerbit <faerbit@gmail.com>

pkgname=lxqt_wallet
_pkgname=${pkgname//_/-}
pkgver=4.0.0
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
  'cmake'
  'kwallet'
  'libsecret'
  'qt6-tools'
)
optdepends=(
  'libsecret: support for Gnome libsecret password storage'
  'kwallet: support for KDE wallet storage'
)
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('d323d25e7ea4d1ea6a4553e4e8e340766d9ec9975ffd34a975b9b33803cef124')

prepare() {
  cd "${_pkgname}-${pkgver}"

  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release  \
    -DNOSECRETSUPPORT=false \
    -DNOKDESUPPORT=false \
    -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${_pkgname}-${pkgver}"

  cmake --build build
}

package() {
    cd "${_pkgname}-${pkgver}"

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
