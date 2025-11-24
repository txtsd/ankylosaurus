# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-git
_pkgname=SpoofDPI
__pkgname=${pkgname%%-git}
pkgver=1.1.1.r0.g4f8b22e
pkgrel=2
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=(x86_64 armv7h aarch64)
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=(glibc)
makedepends=(go git)
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=(!debug)
source=("git+${url}"
  "${__pkgname}.conf.d"
  "${__pkgname}.service")
sha256sums=('SKIP'
            '6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            'a32456dfab36dd2dcfcdf9f7b24bbe3646c9cecda023180e2e658001427045da')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "-compressdwarf=false -linkmode=external -X main.version=${pkgver} -X main.commit=$(git rev-parse --short HEAD 2> /dev/null) -X main.build=archlinux" \
    -o build \
    ./cmd/spoofdpi
}

package() {
  cd "${_pkgname}/build"

  install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
  install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}
