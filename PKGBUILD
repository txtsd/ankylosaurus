# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett
pkgver=0.16.2274
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0')
makedepends=('dotnet-sdk')
options=('!strip' 'staticlibs')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/archive/v${pkgver}.tar.gz"
  'jackett.service'
  'jackett.sysusers'
  'jackett.tmpfiles'
)

sha256sums=('8d5c42aca81ed9afa459469cdb2d15a37748fb0f23976b1df373469482a4d821'
            '9d8f9d73e5fa2b2877dde010c0d8ca6fbf47f03eb1f01b02f846026a949a0dcf'
            'd005fcd009ec5404e1ec88246c31e664167f5551d6cabc35f68eb41750bfe590'
            '64022e15565a609f449090f02d53ee90ef95cffec52ae14f99e4e2132b6cffe1')

build() {
  cd ${pkgname^}-${pkgver}

  case ${CARCH} in
    x86_64)  _CARCH='x64';;
    aarch64) _CARCH='arm64';;
    armv7h)  _CARCH='arm';;
  esac

  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  dotnet publish src/Jackett.Server -f netcoreapp3.1 --self-contained -r linux-${_CARCH} -c Debug -o buid/ /p:AssemblyVersion=${pkgver} /p:FileVersion=${pkgver} /p:InformationalVersion=${pkgver} /p:Version=${pkgver}
}

package() {
  cd ${pkgname^}-${pkgver}
  install -d -m 755 "${pkgdir}/usr/lib/jackett/"
  cp -dpr --no-preserve=ownership buid/* "${pkgdir}/usr/lib/jackett/"

  install -D -m 644 "${srcdir}/jackett.service" "${pkgdir}/usr/lib/systemd/system/jackett.service"
  install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
  install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
}
