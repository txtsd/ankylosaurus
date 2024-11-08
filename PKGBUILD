# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: bitwave <github@oomlu.de>
# Contributor: Stanislas H.B. Sodonon <bidossessi@linuxbenin.com>

pkgname=trelby-git
_pkgname=trelby
pkgver=2.4.10.r10.g24d8930
pkgrel=1
pkgdesc='The free, multiplatform, feature-rich screenwriting program!'
url='https://github.com/trelby/trelby'
arch=(any)
license=('GPL-2.0-or-later')
depends=(
  bash
  python
  python-lxml
  python-reportlab
  python-wxpython
)
makedepends=(
  docbook-xsl
  git
  python-setuptools
)
checkdepends=(python-pytest)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
  "${_pkgname}.xml"
  "${_pkgname}.sh"
  "0001-chore-Adjust-docbook-patch-for-Arch.patch"
)
sha256sums=('SKIP'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42'
            'ad7ee2bcb64510866b3ad4ba7cbb04e88358d66b12874ce348cf5bf074afc895'
            'fecea43670ce96944bbd0af7e7e5b39c000982ad67941e960e304ec1628a83ba')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -Np1 -i ../0001-chore-Adjust-docbook-patch-for-Arch.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz

  make -C doc manpage
  python setup.py sdist

}

check() {
  cd "${srcdir}/${_pkgname}"

  pytest
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
  install -Dm644 "doc/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
  install -Dm755 "${srcdir}/trelby.sh" "${pkgdir}/usr/bin/trelby"
}
