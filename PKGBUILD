# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=superseedr
pkgver=0.9.7
pkgrel=1
pkgdesc='A BitTorrent Client in your Terminal'
arch=(x86_64 aarch64)
url='https://github.com/Jagalite/superseedr'
license=('GPL-3.0-or-later')
depends=(
  gcc-libs
  glibc
  libxcb
  openssl
)
makedepends=(cargo python)
# checkdepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3d3045ef117bc8e78edbf22107cda2e595ad59cf2e45c2b17b088425c4974f95')

prepare() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

# check() {
#   cd "${pkgname}-${pkgver}"

#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cargo test --frozen --release
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
