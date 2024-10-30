# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bitmagnet-beta
_pkgname=${pkgname/-beta}
pkgver=0.10.0_beta.4
pkgrel=1
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://bitmagnet.io'
license=('MIT')
depends=('glibc')
makedepends=('go')
checkdepends=()
optdepends=(
  'postgresql: database'
  'redis: cache'
  'prometheus: metrics'
  'loki: logs'
  'grafana: dashboards'
  'pyroscope: profiling'
)
backup=('etc/bitmagnet/config.yml')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=(!debug)
source=(
  "${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/bitmagnet-io/bitmagnet/archive/refs/tags/v${pkgver//_/-}.tar.gz"
  'config.yml'
  'bitmagnet.service'
  'bitmagnet.sysusers'
  'bitmagnet.tmpfiles'
)
sha256sums=('1d46351df7215e41dfad056ed7215a031fd081cb7b5a3e581b6d37f82c53d2c4'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '05991bd043d80b77eeea2149478290ecef7d8f19b8a0768edf4a55a08dcf3342'
            '9eab02f76a22e3ff627bd6f7fe609480ced67c076f079e985a34d41d13fe8f08'
            '0972b20f948b5e685c659dfefa7a4e200f75fa12dfe9d4779ef3ad5c8ffdca86')

build() {
  cd "${_pkgname}-${pkgver//_/-}"
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/go"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ${_pkgname} -ldflags "-X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=v${pkgver//_/-}"
}

package() {
  cd "${_pkgname}-${pkgver//_/-}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/bitmagnet/config.yml"
  install -Dm644 "${srcdir}/bitmagnet.service" "${pkgdir}/usr/lib/systemd/system/bitmagnet.service"
  install -Dm644 "${srcdir}/bitmagnet.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitmagnet.conf"
  install -Dm644 "${srcdir}/bitmagnet.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitmagnet.conf"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -dpr --no-preserve=ownership "observability" "${pkgdir}/usr/share/${pkgname}/"
}
