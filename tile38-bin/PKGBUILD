# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38-bin
_pkgname="${pkgname%-bin}"
pkgver=1.34.0
pkgrel=1
pkgdesc='An in-memory geolocation data store, spatial index, and realtime geofencing server'
arch=(x86_64 aarch64 armv7h)
url='https://tile38.com'
license=('MIT')
depends=(ca-certificates)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source_x86_64=("${_pkgname}-x86_64-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-aarch64-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
source_armv7h=("${_pkgname}-armv7h-${pkgver}::https://github.com/tidwall/tile38/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm.tar.gz")
sha256sums_x86_64=('1e29c76cc624d1675a7bf5c742ec68d3f4d281373a8756cabbc86a69db783ed1')
sha256sums_aarch64=('7387c0871b6a81635b1e0532c2b71124a197ad9ebb9674e5c852d762ff86aece')
sha256sums_armv7h=('e72f3ee76930d6b46812022bd6907dacd6afae993cbe7b8790adc4206239a22e')

package() {
  local dir
  case $CARCH in
    x86_64) dir="${_pkgname}-${pkgver}-linux-amd64" ;;
    aarch64) dir="${_pkgname}-${pkgver}-linux-arm64" ;;
    armv7h) dir="${_pkgname}-${pkgver}-linux-arm" ;;
  esac
  cd "${dir}"

  install -Dm755 "${_pkgname}"-cli "${pkgdir}/usr/bin/${_pkgname}-cli"
  install -Dm755 "${_pkgname}"-server "${pkgdir}/usr/bin/${_pkgname}-server"
  install -Dm755 "${_pkgname}"-benchmark "${pkgdir}/usr/bin/${_pkgname}-benchmark"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
