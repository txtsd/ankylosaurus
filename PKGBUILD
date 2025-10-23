# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=superseedr
pkgver=0.9.2
_commit=80bc64086db418f329aed1ad2a51d80df32b8e28
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
checkdepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/80bc64086db418f329aed1ad2a51d80df32b8e28.zip")
sha256sums=('4b4015e226f1f8e26fdf3a6e93c5dccfa66004b8920ad835cd54b7928cbb8885')

prepare() {
  cd "${pkgname}-${_commit}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${_commit}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

# check() {
#   cd "${pkgname}-${_commit}"

#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR=target
#   cargo test --frozen --release
# }

package() {
  cd "${pkgname}-${_commit}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
