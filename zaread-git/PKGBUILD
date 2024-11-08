# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Jacob Gogichaishvili <jggsecondary@gmail.com>

pkgname=zaread-git
_pkgname="${pkgname%-git}"
pkgver=r120.c2d45e1
pkgrel=1
pkgdesc='A (very) lightweight ebook and Office document reader'
arch=(any)
url='https://github.com/paoloap/zaread'
license=('GPL-3.0-or-later')
depends=(bash zathura)
optdepends=(
  'libreoffice: To view office suite files'
  'calibre: To view MOBI files'
  'md2pdf: To view markdown files'
)
makedepends=(git)
provides=(zaread)
conflicts=(zaread)
source=('git+https://github.com/paoloap/zaread.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/bin"

  install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
