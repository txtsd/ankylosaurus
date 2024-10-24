# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=bitmagnet
pkgver=0.9.5
pkgrel=1
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://bitmagnet.io'
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=(
  'postgresql: database'
  'redis: cache'
  'prometheus: metrics'
  'loki: logs'
  'grafana: dashboards'
  'pyroscope: profiling')
backup=('etc/bitmagnet/config.yml')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/bitmagnet-io/bitmagnet/archive/refs/tags/v${pkgver}.tar.gz"
  'config.yml'
  'bitmagnet.service'
  'bitmagnet.sysusers'
  'bitmagnet.tmpfiles'
)
sha256sums=('022ff59dc8066dbdbe8273fc1aff050391806994fbaf8ec0381dc10e950c7cfc'
            'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            '64f010000e230da3d3245d2eec2c31df6e3f70c7eaae3e490357ff1145a440c9'
            '9eab02f76a22e3ff627bd6f7fe609480ced67c076f079e985a34d41d13fe8f08'
            '0972b20f948b5e685c659dfefa7a4e200f75fa12dfe9d4779ef3ad5c8ffdca86')

build() {
  cd "${pkgname}-${pkgver}"
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}/go"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o ${pkgname} -ldflags "-X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=v${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/bitmagnet/config.yml"
  install -Dm644 "${srcdir}/bitmagnet.service" "${pkgdir}/usr/lib/systemd/system/bitmagnet.service"
  install -Dm644 "${srcdir}/bitmagnet.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitmagnet.conf"
  install -Dm644 "${srcdir}/bitmagnet.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitmagnet.conf"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -dpr --no-preserve=ownership "observability" "${pkgdir}/usr/share/${pkgname}/"
}
