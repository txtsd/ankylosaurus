# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38-bin
_pkgname="${pkgname%-bin}"
pkgver=1.34.3
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
sha256sums_x86_64=('57e1fe318e35ee0186f5330383628ac4a0b15e6e388e19b3f2bbe8abf3cbca9b')
sha256sums_aarch64=('2733e0bb7c0c595a283bafa832c34190b1759739ad4e816951b0b52662be23a5')
sha256sums_armv7h=('3b73e2dae76c0563a5fd095602f1e98ec26b4d8a9dd752572ec435f640fe9ca6')

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
