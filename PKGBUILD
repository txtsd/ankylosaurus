# Maintainer: FirstAirBender <noblechuk5[at]gmail[dot]com>
# Maintainer: txtsd <aur.archlinux@ihaveea.quest>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.6.0
pkgrel=2
pkgdesc='Open source client library for Spotify'
arch=(x86_64 armv7h aarch64)
url='https://github.com/librespot-org/librespot'
license=('MIT')
depends=(
  alsa-lib
  avahi
  gcc-libs
  glibc
  gst-plugins-base-libs
  gstreamer
)
makedepends=(
  cargo
  git
  jack2
  libpulse
  portaudio
  sdl2
)
optdepends=(
  'gst-plugins-base: Audio playback using GStreamer'
  'gst-plugins-good: Audio playback using GStreamer'
  'jack2: Audio playback using JACK'
  'libpulse: Audio playback using PulseAudio'
  'portaudio: Audio playback using PortAudio'
  'sdl2: Audio playback using SDL2'
)
options=(!lto)
source=("git+${url}#tag=v${pkgver}")
sha256sums=('d3c81a50769223bf120689b9c7654a2d25fb5e4b03648149562c1c702ca3b467')

prepare() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features --workspace
}

check() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features --workspace
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "contrib/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "contrib/${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
