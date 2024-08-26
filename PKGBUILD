# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi
_pkgname=SpoofDPI
_binname=spoof-dpi
pkgver=0.10.11
pkgrel=1
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4d907445a0c481c9b408907cb42757e90ab42c63cfcc146c96ec6eadea97ecba')

prepare() {
    cd "${_pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${_pkgname}-${pkgver}"
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
    cd "${_pkgname}-${pkgver}/build"
    install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
}

