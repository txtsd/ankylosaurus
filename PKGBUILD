# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=porla
pkgver=0.40.0
pkgrel=1
pkgdesc='A high performance BitTorrent client for servers and seedboxes'
arch=(x86_64 aarch64)
url='https://porla.org'
license=('MIT')
depends=(
  boost-libs
  gcc-libs
  glibc
  libgit2
  libidn2
  libldap
  libnghttp2
  libpsl
  libsodium
  libssh2
  libtorrent-rasterbar
  libzip
  lua
  openssl
  sqlite
  tomlplusplus
)
makedepends=(
  antlr4-runtime
  boost
  cmake
  curl
  duktape
  git
  jwt-cpp
  nlohmann-json
  npm
  sol2
  uriparser
  uwebsockets
  zip
  zlib
)
backup=(etc/porla/config.toml)
_tag_curl='curl-8_10_1'
source=(
  "git+https://github.com/${pkgname}/${pkgname}.git#tag=v${pkgver}"
  'git+https://github.com/uNetworking/uWebSockets.git'
  'git+https://github.com/uNetworking/uSockets.git'
  "https://github.com/curl/curl/archive/refs/tags/${_tag_curl}.tar.gz"
  0001-patch-for-arch.patch
  porla.toml
  porla.service
  porla.sysusers
  porla.tmpfiles
)
sha256sums=('dd4e215c72822fe5fbaa212f87ccaebaba54281ccf9f6cc4f0ce51ee173401ad'
            'SKIP'
            'SKIP'
            '5aaf131294f734756325dd99d849518c9a5060fc702517ab3064c76257dc700c'
            'd7f7a09ffb68a773b805e68df3ea7cd1c55f5c33710e66e83926f3460cf631c4'
            'fa1962c158eae8f47b99cf6e2c0403c1f2e00c430e15f33780b9b91123c6637f'
            '277760130b9c35ca5d009be5b3838fdccc7cc89d19392afea54322b91c3a9f08'
            'a1d0aed79d00d65c1a1dee38249adf0e94091f36b838bb31d734ce6d3d152baf'
            '1baaa181b6f44a6c06a80b39f9b6871a4cf8c09cfe141d3a1013ee3669f31032')

prepare() {
  cd "${pkgname}"

  patch -Np1 -i "${srcdir}/0001-patch-for-arch.patch"

  git submodule init
  git config submodule.vendor/uWebSockets.url "${srcdir}/uWebSockets"
  git -c protocol.file.allow=always submodule update

  pushd vendor/uWebSockets
  git config submodule.uSockets.url "${srcdir}/uSockets"
  git -c protocol.file.allow=always submodule update
  popd

  cd html
  npm install --frozen-lockfile
}

build() {
  cd "${pkgname}"

  export CXXFLAGS="${CXXFLAGS/-pedantic/}"

  pushd html
  npm run build
  pushd dist
  zip -9 -r ../webui.zip *
  popd
  popd

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLINK_WITH_STATIC_LIBRARIES=true \
    -DOPENSSL_USE_STATIC_LIBS=false \
    -DBUILD_SHARED_LIBS=true \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_CURL="${srcdir}/curl-${_tag_curl}"
  cmake --build build
}

package() {
  cd "${pkgname}"

  # DESTDIR="${pkgdir}" cmake --install build
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/porla.toml" "${pkgdir}/etc/porla/config.toml"
  install -Dm644 "${srcdir}/porla.service" "${pkgdir}/usr/lib/systemd/system/porla.service"
  install -Dm644 "${srcdir}/porla.sysusers" "${pkgdir}/usr/lib/sysusers.d/porla.conf"
  install -Dm644 "${srcdir}/porla.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/porla.conf"
}
