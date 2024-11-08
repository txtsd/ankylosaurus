# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=stevenarella-git
_pkgname=stevenarella
pkgver=r999.gecf829c
pkgrel=1
pkgdesc='Multi-protocol Minecraft-compatible client written in Rust'
arch=(x86_64)
url='https://github.com/iceiix/stevenarella'
license=('Apache-2.0 AND MIT')
depends=(
  openssl
  xcb-util
  gcc-libs
  libxcb
  glibc
  freetype2
  fontconfig
)
makedepends=(
  cmake
  rust
  git
)
source=('git+https://github.com/iceiix/stevenarella.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  echo r$(git rev-list --all --count).g$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 resources/icon128x128.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
