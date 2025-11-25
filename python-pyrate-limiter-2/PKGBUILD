# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jordan Cook <JCook83@gmail.com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=python-pyrate-limiter-2
pkgdesc="Python Rate-Limiter using Leaky-Bucket Algorithm"
pkgver=2.10.0
pkgrel=2
arch=(any)
url=https://github.com/vutran1710/PyrateLimiter
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
optdepends=(
  'python-filelock: concurrent sqlite backend'
  'python-redis: redis backend'
)
conflicts=(python-pyrate-limiter)
options=(!debug)
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('4c0669c9ab517dbbac2d6bc460cb0d6996074e4534cc4cb9f65ae51836fedf18')

pkgver() {
  cd PyrateLimiter
  git describe --tags | sed 's/^v//'
}

build() {
  cd PyrateLimiter
  python -m build --wheel --no-isolation
}

package() {
  cd PyrateLimiter
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
