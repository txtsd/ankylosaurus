# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy
pkgver=2024.9
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme' 'alsa-lib')
makedepends=('cargo')
checkdepends=('cargo')
provides=('halloy')
conflicts=('halloy')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/squidowl/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b5eef2111ca4fa11f62d91368b2d0aafe637ae1743c3006e9c9dc76242d95c0b')

prepare() {
    cd "${pkgname}-${pkgver}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "assets/linux/org.squidowl.${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "assets/linux/org.squidowl.${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "assets/linux/icons" "${pkgdir}/usr/share"
}
