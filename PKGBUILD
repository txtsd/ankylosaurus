# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Dan Johansen <strit83 at gmail dot com>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname=opentracker
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc='A free and open torrent tracker'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url='http://erdgeist.org/arts/software/opentracker/'
license=('LicenseRef-Beerware')
depends=(glibc zlib)
makedepends=(
  cvs
  gcc
)
backup=('etc/opentracker/opentracker.conf')
source=(
  "https://erdgeist.org/arts/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
  'opentracker.service'
  'opentracker.sysusers'
  'opentracker.tmpfiles'
)
sha256sums=('8109cbf271d4374020af719aca5448b1354517c0b2f4b74b167332944a61eb31'
            '0a3a08287ad2f754d2e01c3a9f85f0d0d73ee5f27f851fad7390794eaee85c45'
            'c0097bc231e0f6f7c8ff17e3cca99f2215218cc227476a4390936b04300c8fc7'
            '0c7f180db96168dd7546b30cb276ab1058201c919059b251d84868fe63990f08')

_cvsroot=':pserver:cvs@cvs.fefe.de:/cvs'
_cvsmod='libowfat'

prepare() {
  cd "${srcdir}"
  echo "Getting ${_cvsmod} from ${_cvsroot} ..."
  if [ -d "${_cvsmod}/CVS" ]; then
    cd "${_cvsmod}"
    cvs -z9 update -d
  else
    cvs -d "${_cvsroot}" -z9 co "${_cvsmod}"
  fi
}

build() {
  cd libowfat
  make
  cd ..
  cd "opentracker-${pkgver}"
  make
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
