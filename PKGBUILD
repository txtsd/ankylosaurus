# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: bitwave <github@oomlu.de>
# Contributor: Stanislas H.B. Sodonon <bidossessi@linuxbenin.com>

pkgname=trelby-git
_pkgname=trelby
pkgver=2.4.13.r4.gdd1b514
pkgrel=1
pkgdesc='The free, multiplatform, feature-rich screenwriting program!'
url='https://github.com/trelby/trelby'
arch=(any)
license=('GPL-2.0-or-later')
depends=(
  python
  python-lxml
  python-reportlab
  python-wxpython
)
makedepends=(
  docbook-xsl
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=(
  "git+${url}.git"
  "${_pkgname}.xml"
  "0001-chore-Adjust-docbook-patch-for-Arch.patch"
)
sha256sums=('SKIP'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42'
            'fecea43670ce96944bbd0af7e7e5b39c000982ad67941e960e304ec1628a83ba')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  patch -Np1 -i ../0001-chore-Adjust-docbook-patch-for-Arch.patch
}

build() {
  cd "${_pkgname}"

  make -C doc manpage
  python -m build --wheel --no-isolation

}

check() {
  cd "${_pkgname}"

  pytest
}

package() {
  cd "${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rf "${pkgdir}/usr/lib/python${python_version}/site-packages/tests/"

  install -Dm644 "trelby/resources/trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "trelby/resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
  install -Dm644 "doc/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
