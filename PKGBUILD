# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Faerbit <faerbit@gmail.com>

pkgname=lxqt_wallet
_pkgname=${pkgname//_/-}
pkgver=3.2.2
pkgrel=2
pkgdesc='Secure information storage for LXQt'
arch=('x86_64')
url='https://github.com/lxqt/lxqt_wallet'
license=('BSD-2-Clause')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'libgcrypt'
  'qt5-base'
)
makedepends=(
  'cmake'
  'kwallet'
  'libsecret'
  'qt5-tools'
)
optdepends=(
  'libsecret: support for Gnome libsecret password storage'
  'kwallet: support for KDE wallet storage'
)
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('1e41383cd60e1d23f96a9918f9eb552871afeb5abd202b3678305f59e70f0339')

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
