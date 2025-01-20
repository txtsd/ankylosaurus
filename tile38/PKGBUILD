# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=tile38
pkgver=1.34.1
pkgrel=1
pkgdesc='An in-memory geolocation data store, spatial index, and realtime geofencing server'
arch=(x86_64 armv7h aarch64)
url='https://tile38.com'
license=('MIT')
depends=(ca-certificates)
makedepends=(git go)
source=("git+https://github.com/tidwall/tile38#tag=${pkgver}")
sha256sums=('ad90112830f85b51cb4955c8b62019ad50c734e4ac7d9a70fa99072a2d20a8c0')

prepare() {
  cd "${pkgname}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=0
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
    -X github.com/tidwall/tile38/core.Version=${pkgver} \
    -X github.com/tidwall/tile38/core.GitSHA=${sha256sums[0]:0:7} \
    -X github.com/tidwall/tile38/core.BuildTime=$(date -u +'%Y-%m-%dT%H:%M:%SZ' --date=@${SOURCE_DATE_EPOCH}) \
  "
  core/gen.sh
  go build \
    -ldflags "${_ldflags}" \
    -o build \
    ./cmd/...
}

check() {
  cd "${pkgname}"
  go test ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 build/tile38-cli "${pkgdir}/usr/bin/tile38-cli"
  install -Dm755 build/tile38-server "${pkgdir}/usr/bin/tile38-server"
  install -Dm755 build/tile38-benchmark "${pkgdir}/usr/bin/tile38-benchmark"
  install -Dm755 build/tile38-luamemtest "${pkgdir}/usr/bin/tile38-luamemtest"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
