# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=extracker-git
_pkgname="${pkgname%-git}"
__pkgname=ExTracker
pkgver=r191.face96f
pkgrel=1
pkgdesc='A highly parallel bittorrent tracker made in Elixir'
arch=(x86_64)
url='https://github.com/Dahrkael/ExTracker'
license=('Apache-2.0')
depends=(
  bash
  gcc-libs
  glibc
  ncurses
  openssl
  zlib
)
makedepends=(
  elixir
  erlang-asn1
  erlang-public_key
  erlang-sasl
  erlang-ssl
  git
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!debug)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${__pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${__pkgname}"
  mix local.hex --force && mix local.rebar --force
  mix deps.get
}

build() {
  cd "${__pkgname}"
  mix deps.compile
  mix compile
  mix release ${_pkgname}
}

check() {
  cd "${__pkgname}"
  mix test
}

package() {
  cd "${__pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r "_build/dev/rel/extracker" "${pkgdir}/opt"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
