# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-git
_pkgname=SpoofDPI
__pkgname=${pkgname%%-git}
_binname=spoof-dpi
pkgver=0.10.11.r1.g774240e
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
options=('!debug')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    mkdir -p build/
}

build() {
    cd "${_pkgname}"
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/spoof-dpi/
}

package() {
    cd "${_pkgname}/build"
    install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}

