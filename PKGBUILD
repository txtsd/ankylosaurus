# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi
pkgver=1.5.1
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=(glibc)
makedepends=(go)
backup=(etc/conf.d/spoofdpi)
options=(!debug)
source=(
  "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.conf.d"
  "${pkgname}.service"
)
sha256sums=('4bd43de5575aff15403a1d96d096d8c3ceefe17a54153d3b2c8d9ace8e96b389'
            '6aa0ecb1d0073b970d0f0a71fae521ed1342a4aa9d8ed1887fdadb2f751edb92'
            '76a22a11e7ffa2c362f32d2e05cee16b056a6ce9b64b3ea10ece8732e77e917a')

prepare() {
  cd "${pkgname}-${pkgver}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -linkmode=external"
  export _LDFLAGS="${_LDFLAGS} -X main.version=${pkgver}"
  export _LDFLAGS="${_LDFLAGS} -X main.commit=$(cat COMMIT)"
  export _LDFLAGS="${_LDFLAGS} -X main.build=archlinux"
  export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o build \
    ./cmd/spoofdpi
}

package() {
  cd "${pkgname}-${pkgver}/build"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
