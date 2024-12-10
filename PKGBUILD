# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=archosaur-git
_pkgname="${pkgname%-git}"
pkgver=1.0.0.r3.gbba498a
pkgrel=1
pkgdesc='A PKGBUILD management framework for the Arch User Repository'
arch=(any)
url="https://github.com/txtsd/${_pkgname}"
license=('GPL-2.0-or-later')
depends=(bash openssh)
makedepends=(asciidoc git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  make PREFIX=/usr
}

package() {
  cd "${_pkgname}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
