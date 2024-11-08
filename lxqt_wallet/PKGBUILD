# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Faerbit <faerbit@gmail.com>

pkgname=lxqt_wallet
_pkgname="${pkgname//_/-}"
pkgver=4.0.2
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
  kwallet
  libsecret
  qt6-tools
)
optdepends=(
  'libsecret: support for Gnome libsecret password storage'
  'kwallet: support for KDE wallet storage'
)
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('3dbfc24555e88f6dd8aa79c2bf22e455f82d6a332e95418b08788d7adc226e50')

build() {
  cd "${_pkgname}-${pkgver}"

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
    cd "${_pkgname}-${pkgver}"

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
