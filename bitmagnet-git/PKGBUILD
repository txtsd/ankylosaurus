# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: davispuh <davispuh@gmail.com>

pkgname=bitmagnet-git
_pkgname="${pkgname%-git}"
pkgver=0.10.0.beta.4.r0.36d989b
pkgrel=1
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=(x86_64 aarch64 armv7h)
url='https://bitmagnet.io'
license=('MIT')
depends=(glibc)
makedepends=(git go)
optdepends=(
  'grafana: dashboards'
  'loki: logs'
  'postgresql: database'
  'prometheus: metrics'
  'pyroscope: profiling'
  'redis: cache'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=(etc/bitmagnet/config.yml)
source=(
  'git+https://github.com/bitmagnet-io/bitmagnet'
  config.yml
  bitmagnet.service
  bitmagnet.sysusers
  bitmagnet.tmpfiles
)
sha256sums=('SKIP'
            '01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b'
            'a735d0434480bc357664648671c8ba92a82d7f262bdb54c093ad0ba3d6ba3242'
            '9eab02f76a22e3ff627bd6f7fe609480ced67c076f079e985a34d41d13fe8f08'
            'bf2fc8cbf9d6191bee505c957e3e7642f20aa2de05ce92af8270913094de4498')

pkgver() {
  cd "${_pkgname}"

  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${_pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="\
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
  "
  local _ld_flags=" \
    -compressdwarf=false \
    -linkmode=external \
    -X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=v${pkgver} \
  "
  go build \
    -ldflags "${_ldflags}" \
    -o "${_pkgname}"
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/config.yml" "${pkgdir}/etc/bitmagnet/config.yml"
  install -Dm644 "${srcdir}/bitmagnet.service" "${pkgdir}/usr/lib/systemd/system/bitmagnet.service"
  install -Dm644 "${srcdir}/bitmagnet.sysusers" "${pkgdir}/usr/lib/sysusers.d/bitmagnet.conf"
  install -Dm644 "${srcdir}/bitmagnet.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/bitmagnet.conf"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -dpr --no-preserve=ownership observability "${pkgdir}/usr/share/${pkgname}/"
}
