# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv
pkgver=1.17.7
pkgrel=2
pkgdesc="DVD and Blu-ray to MKV converter"
arch=(x86_64 i686 aarch64)
url="https://www.makemkv.com"
license=('LicenseRef-GuinpinSoft-inc-EULA' LGPL-2.1-or-later)
depends=(qt5-base ffmpeg)
optdepends=(java-runtime)
optdepends_x86_64=('lib32-glibc: dts support')
install=makemkv.install
source=(${url}/download/${pkgname}-bin-${pkgver}.tar.gz
        ${url}/download/${pkgname}-oss-${pkgver}.tar.gz
        makemkv.1
        makemkvcon.1
        mmdtsdec.1)
noextract=(${pkgname}-bin-${pkgver}.tar.gz
           ${pkgname}-oss-${pkgver}.tar.gz)
sha256sums=('a760e1e484c1b28934a4557e7766cc1af8392ef717f5bb34d6eeafd38a0b0d01'
            'f26f59705dc6bf274312d446a7b3f0b5c827f137d5b823761ee7953a528db2b7'
            '5573b2e4bade10d8cd258a7c235eb46f66ef8c8c97e5d5eb090c38fa0f94389b'
            'f12c0facf2f0071a9f728b138986f0a4c2b4ff6ace2dfb2e96364e215e9fda6f'
            '2a6237d3d5ce073734c658c7ec5d2141ecd0047e6d3c45d1bd594135c928878f')

prepare() {
  cd ${srcdir}
  mv ${pkgname}-bin-${pkgver}.tar.gz ${pkgname}-bin-${pkgver}.tar.gz.gz
  mv ${pkgname}-oss-${pkgver}.tar.gz ${pkgname}-oss-${pkgver}.tar.gz.gz
  gzip -df ${pkgname}-bin-${pkgver}.tar.gz.gz
  gzip -df ${pkgname}-bin-${pkgver}.tar.gz
  tar -xf ${pkgname}-bin-${pkgver}.tar
  gzip -df ${pkgname}-oss-${pkgver}.tar.gz.gz
  gzip -df ${pkgname}-oss-${pkgver}.tar.gz
  tar -xf ${pkgname}-oss-${pkgver}.tar
}

build() {
  cd "${srcdir}/${pkgname}-oss-${pkgver}"
  #CFLAGS="$CFLAGS -std=c++11" CC=gcc CXX=g++ ./configure --prefix=/usr
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-oss-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${pkgname}-bin-${pkgver}"
  install -d tmp
  echo accepted > tmp/eula_accepted
  make DESTDIR="${pkgdir}" install

  install -Dm 644 src/eula_en_linux.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula_en_linux.txt"

  cd "${srcdir}/"
  install -d "${pkgdir}/usr/share/man/man1/"
  install -m 644 -t "${pkgdir}/usr/share/man/man1/" makemkv.1 makemkvcon.1 mmdtsdec.1
}
