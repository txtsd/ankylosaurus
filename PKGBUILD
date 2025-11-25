# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=linux-command-gpt-git
_pkgname=linux-command-gpt
pkgver=0.2.3.r0.gd13a83a
pkgrel=1
pkgdesc='Get Linux commands in natural language with the power of ChatGPT'
arch=(x86_64 aarch64)
url='https://github.com/asrul10/linux-command-gpt'
license=('MIT')
depends=(glibc)
makedepends=(git go)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  export GOPATH="${srcdir}"
  export GOFLAGS="-modcacherw"
  go mod download
}

build() {
  cd "${_pkgname}"

  export _LDFLAGS="${_LDFLAGS} -compressdwarf=false"
  export _LDFLAGS="${_LDFLAGS} -linkmode=external"
  export _LDFLAGS="${_LDFLAGS} -extldflags \"${LDFLAGS}\""
  export GOPATH="${srcdir}"

  go build \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags "${_LDFLAGS}" \
    -o lcg
}

check() {
  cd "${_pkgname}"

  go test ./...
}

package() {
  cd "${_pkgname}"

  install -Dm755 "lcg" "${pkgdir}/usr/bin/lcg"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
