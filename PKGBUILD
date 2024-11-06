# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38-bin
_pkgname="${pkgname%-bin}"
pkgver=1.33.4
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
sha256sums_x86_64=('12e6f95f6716b0e61d7ac2de317307cd61f8e97ba796f5e3eb47bb2398ad5524')
sha256sums_aarch64=('1600e32b479ae873884282f9a360c198168d765faebc2ea83cd2c86b78368abd')
sha256sums_armv7h=('5a21e1b578a393a1ec51f0a248614865f275b738c68e6f3f5bf3fab5f3578998')

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
