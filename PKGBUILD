# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=linux-command-gpt-git
_pkgname=linux-command-gpt
pkgver=0.2.1.r1.g7a40d8d
pkgrel=2
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
  "
  go build \
    -ldflags "${_ldflags}" \
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
