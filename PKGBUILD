# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi
_pkgname=SpoofDPI
pkgver=1.1.1
pkgrel=2
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=(glibc)
makedepends=(go)
backup=(etc/conf.d/spoofdpi)
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.conf.d"
  "${pkgname}.service"
)
sha256sums=('28c11f40cebe4ecbc7f27a7909b37b8ce8955a116dbe98cd018664da1e41a76a'
            '6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            'a32456dfab36dd2dcfcdf9f7b24bbe3646c9cecda023180e2e658001427045da')

prepare() {
  cd "${_pkgname}-${pkgver}"

  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${_pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "-compressdwarf=false -linkmode=external -X main.version=${pkgver} -X main.build=archlinux" \
    -o build \
    ./cmd/spoofdpi
}

package() {
  cd "${_pkgname}-${pkgver}/build"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
