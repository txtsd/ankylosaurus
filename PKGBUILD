# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38-bin
_pkgname="${pkgname%-bin}"
pkgver=1.34.2
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
sha256sums_x86_64=('dea5fe658e9963e21781dca362b041c5614a9fc6f03c48b9dc2b95adcdbd6e30')
sha256sums_aarch64=('724ff92bb528a4b240b8eaaee034cd062dcfd3cca49cbc0a75ca0f03bc9769f6')
sha256sums_armv7h=('ec0e031daa0717a58e95b101ee4ca91b854d94b77d23f63423432373833f8193')

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
