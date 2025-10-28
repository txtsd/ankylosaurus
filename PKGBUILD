# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: John Gerritse <tyrannis dot hawk at gmail dot com>
# Contributor: tdy <tdy@archlinux.info>

pkgname=trelby
pkgver=2.4.16
pkgrel=1
pkgdesc='The free, multiplatform, feature-rich screenwriting program!'
arch=(any)
url='https://github.com/trelby/trelby'
license=('GPL-2.0-or-later')
depends=(
  python
  python-lxml
  python-reportlab
  python-wxpython
)
makedepends=(
  docbook-xsl
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.xml"
  0001-chore-Adjust-docbook-patch-for-Arch.patch
)
sha256sums=('dd29448e4c307594a57ef7651711894693ca8a13982fac3e54ec8a32cd99f050'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42'
            'fecea43670ce96944bbd0af7e7e5b39c000982ad67941e960e304ec1628a83ba')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i ../0001-chore-Adjust-docbook-patch-for-Arch.patch
}

build() {
  cd ${pkgname}-${pkgver}

  make -C doc manpage
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}

  pytest
}

package() {
  cd ${pkgname}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rf "${pkgdir}/usr/lib/python${python_version}/site-packages/tests/"

  install -Dm644 trelby/resources/trelby.desktop "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 trelby/resources/icon256.png "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "doc/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
