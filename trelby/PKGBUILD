# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: John Gerritse <tyrannis dot hawk at gmail dot com>
# Contributor: tdy <tdy@archlinux.info>

pkgname=trelby
pkgver=2.4.10
pkgrel=1
pkgdesc='The free, multiplatform, feature-rich screenwriting program!'
arch=(any)
url='https://github.com/trelby/trelby'
license=('GPL-2.0-or-later')
depends=(
  bash
  python
  python-lxml
  python-reportlab
  python-wxpython
)
makedepends=(python-setuptools docbook-xsl)
checkdepends=(python-pytest)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "${pkgname}.xml"
  "${pkgname}"
  0001-chore-Adjust-docbook-patch-for-Arch.patch
)
sha256sums=('f35e7479c76636012cbd5b04dc5d4d34283203f68e732d6d3f2dc1745e8998f7'
            'eb9332ff5bd22988ac87231851876df76220a581e1f5bfc5b782cff10ccffe42'
            'ad7ee2bcb64510866b3ad4ba7cbb04e88358d66b12874ce348cf5bf074afc895'
            'fecea43670ce96944bbd0af7e7e5b39c000982ad67941e960e304ec1628a83ba')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -Np1 -i ../0001-chore-Adjust-docbook-patch-for-Arch.patch
}

build() {
  cd ${pkgname}-${pkgver}

  gzip -c names.txt > names.txt.gz
  gzip -c dict_en.dat > dict_en.dat.gz

  make -C doc manpage
  python setup.py sdist
}

check() {
  cd ${pkgname}-${pkgver}

  pytest
}

package() {
  cd ${pkgname}-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 "trelby.desktop" "${pkgdir}/usr/share/applications/trelby.desktop"
  install -Dm644 "resources/icon256.png" "${pkgdir}/usr/share/trelby/resources/icon256.png"
  install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "doc/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm755 "${srcdir}/trelby" "${pkgdir}/usr/bin/trelby"
}
