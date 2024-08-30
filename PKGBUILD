# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=spoofdpi-git
_pkgname=SpoofDPI
__pkgname=${pkgname%%-git}
pkgver=0.11.1.r6.g8a252f4
pkgrel=2
pkgdesc='A simple and fast anti-censorship tool written in Go'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/xvzc/SpoofDPI'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
provides=("${__pkgname}")
conflicts=("${__pkgname}")
backup=(etc/conf.d/spoofdpi)
options=('!debug')
source=("git+${url}"
        "${__pkgname}.conf.d"
        "${__pkgname}.service")
sha256sums=('SKIP'
            '6b7e46d23d15fbefaf8c1e031a2cea92a74f03a0ff7b19c2dd570f1b4bff324a'
            '0bf85fb5e4f2b470d5aad94e2f0cd4cd00e461736ff483480b89d8cd069e53f4')

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
    go build -o build ./cmd/${__pkgname}/
}

package() {
    cd "${_pkgname}/build"
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.conf.d" "${pkgdir}/etc/conf.d/${__pkgname}"
    install -Dm644 "${srcdir}/${__pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${__pkgname}.service"
}

