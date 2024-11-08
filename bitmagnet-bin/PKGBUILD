# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bitmagnet-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.5
pkgrel=2
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=(x86_64 aarch64 armv7h)
url='https://bitmagnet.io'
license=('MIT')
depends=(glibc)
makedepends=(go)
optdepends=(
  'grafana: dashboards'
  'loki: logs'
  'postgresql: database'
  'prometheus: metrics'
  'pyroscope: profiling'
  'redis: cache'
)
backup=(etc/bitmagnet/config.yml)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=(
  "https://github.com/bitmagnet-io/bitmagnet/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz"
  config.yml
  bitmagnet.service
  bitmagnet.sysusers
  bitmagnet.tmpfiles
)
sha256sums=('93d1dc503c92ed53d1eb7c18ae0b53f6d8c5c42e5d4440a62b01887395aa123d'
            '01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b'
            'e9f8ee3b561297d673ca52c6e2dd98a061a4d5569542d3cd80703c25e854d404'
            '9eab02f76a22e3ff627bd6f7fe609480ced67c076f079e985a34d41d13fe8f08'
            '0972b20f948b5e685c659dfefa7a4e200f75fa12dfe9d4779ef3ad5c8ffdca86')

package() {
  cd ${srcdir}

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 licenses/LICENSE_anacrolix "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_anacrolix"

  install -Dm644 config.yml "${pkgdir}/etc/bitmagnet/config.yml"
  install -Dm644 bitmagnet.service "${pkgdir}/usr/lib/systemd/system/bitmagnet.service"
  install -Dm644 bitmagnet.sysusers "${pkgdir}/usr/lib/sysusers.d/bitmagnet.conf"
  install -Dm644 bitmagnet.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/bitmagnet.conf"
}
