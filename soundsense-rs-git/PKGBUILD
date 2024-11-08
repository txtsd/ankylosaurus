# Maintainer: Michael Serajnik <m at mser dot at>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=soundsense-rs-git
_pkgname=soundsense-rs
pkgver=1.5.1.travis.r12.gf701020
pkgrel=4
pkgdesc="A Rust version of SoundSense"
arch=(x86_64)
url="https://github.com/prixt/${_pkgname}"
license=('MIT')
depends=(
  gcc-libs
  glib2
  glibc
  gtk3
  alsa-lib
  webkit2gtk
)
makedepends=(
  alsa-lib
  git
  rust
)
options=(!lto)
source=(
  "git+https://github.com/prixt/${_pkgname}.git"
  soundsense-rs.desktop
  linux_web_fix.patch
)
sha256sums=('SKIP'
            'ced141bf8441d271ee610beebe79cdd5bfe287b1d157d79a7c470d0e44673e5f'
            'd427efa76714279f114b3b88dd584dc3b3fe55236c361fbaf09a77358e25afc8')

prepare() {
  cd "${_pkgname}"

  patch -Np1 -i "${srcdir}/linux_web_fix.patch"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 icons/icon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  cd "${srcdir}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
