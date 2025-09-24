# Maintainer: FirstAirBender <noblechuk5[at]gmail[dot]com>
# Maintainer: txtsd <aur.archlinux@ihaveea.quest>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=librespot
pkgver=0.7.1
pkgrel=1
pkgdesc='Open source client library for Spotify'
arch=(x86_64 armv7h aarch64)
url='https://github.com/librespot-org/librespot'
license=('MIT')
depends=(
  alsa-lib
  gcc-libs
  glibc
  gst-plugins-base-libs
  gstreamer
)
makedepends=(
  cargo
  git
  jack
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
sha256sums=('f34649e8036ef2442c1c6554b721090b6a49f9e08770219fe4dbbc9daa3b6597')

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
  cargo build --frozen --release --features "native-tls rodio-backend alsa-backend portaudio-backend pulseaudio-backend jackaudio-backend rodiojack-backend sdl-backend gstreamer-backend with-libmdns passthrough-decoder"
}

check() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --features "native-tls rodio-backend alsa-backend portaudio-backend pulseaudio-backend jackaudio-backend rodiojack-backend sdl-backend gstreamer-backend with-libmdns passthrough-decoder"
}

package() {
  cd "${pkgname}"

  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "contrib/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "contrib/${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
