# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-isocodes
_name=${pkgname#python-}
pkgver=2024.2.2
pkgrel=1
pkgdesc="provides lists of various ISO standards (e.g. country, language, language scripts, and currency names) in one place"
url="https://github.com/sparkmicro/isocodes-api/"
# the upstream doesn't know how to separate dev and prod deps; this has 0 deps
# beyond Python
depends=(
    'python'
)
makedepends=(python-build python-installer python-wheel python-hatchling)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('50b747edb5f4e1e7bb740e972ec5062b9819fc1fd417c33ee6334436a3367f6a')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
