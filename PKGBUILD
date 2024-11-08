# Maintainer: Adrian Lopez <zeioth@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=linux-command-gpt
pkgver=0.2.1
pkgrel=1
pkgdesc='Get Linux commands in natural language with the power of ChatGPT'
arch=(x86_64 aarch64)
url='https://github.com/asrul10/linux-command-gpt'
license=('MIT')
depends=(glibc)
makedepends=(git go)
source=("git+${url}#tag=v${pkgver}")
sha256sums=('b82ab79c3536c160bf4563c4df87f21acf5a312aa38bf3cf329636a63f2c7977')

prepare() {
  cd "${pkgname}"

  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${pkgname}"

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
  cd "${pkgname}"

  go test ./...
}

package() {
  cd "${pkgname}"

  install -Dm755 "lcg" "${pkgdir}/usr/bin/lcg"
  install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
