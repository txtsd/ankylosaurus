# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Sashanoraa <sasha@noraa.gay>

pkgname=python-confusables
pkgver=1.2.0
pkgrel=4
pkgdesc='A python package providing functionality for matching words that can be confused for eachother, but contain different characters.'
arch=(any)
url='https://pypi.org/project/confusables/'
license=('MIT')
_name="${pkgname#python-}"
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  "license-${pkgver}::https://github.com/woodgern/confusables/raw/master/LICENSE"
)
depends=(python)
makedepends=(python-setuptools)
sha256sums=('429caad05333832e1edabb80815704cd26530514369430f913002b2ba548c38e'
            'b4d388d7b48d81d49e99939d564968733e99c316625a2a64e6a8103ca59ac596')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd ${_name}-${pkgver}
  python -m unittest discover -vs .
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "${pkgdir}${site_packages}/tests/"

  install -Dm644 "${srcdir}/license-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
