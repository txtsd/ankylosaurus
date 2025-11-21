# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Contributor: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=comictagger-beta
pkgver=1.6.0_beta.8
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='A multi-platform app for writing metadata to digital comics'
arch=(any)
url='https://github.com/comictagger/comictagger'
license=('Apache-2.0')
depends=(
  python
  python-appdirs
  python-beautifulsoup4
  python-chardet
  python-comicfn2dict
  python-idna
  python-importlib-metadata
  python-isocodes
  python-natsort
  python-niquests
  python-packaging
  python-pathvalidate
  python-pillow
  python-pillow-jpegxl-plugin
  python-py7zr
  python-pyicu
  python-pyqt6
  python-pyqt6-webengine
  python-pyrate-limiter-2
  python-rapidfuzz
  python-rarfile
  python-requests
  python-settngs
  python-text2digits
  python-typing_extensions
  python-urllib3
  python-wordninja
  python-yaml
  python-zipremove
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
options=(!debug)
source=(
  git+${url}.git#tag=${_pkgver}
  0001-Patch-for-outdated-python-isocodes.patch
)
sha256sums=('2e1c658eb4124344146d17773043e809b8eb80191917ae3de303518d8d7e4590'
            '098fc663b199a66258477a1368c4a484a57dcd4cca1c6075ca52cd058cf3a597')

prepare() {
  cd comictagger

  patch -Np1 -i ../0001-Patch-for-outdated-python-isocodes.patch

  # sed -e 's/RequestRate/Rate/g' -i tests/conftest.py
  # sed -e 's/RequestRate/Rate/g' -i comictalker/talkers/comicvine.py

  sed -e 's|/usr/local/share/comictagger/app.png|/usr/share/icons/comictagger.png|g' \
    -e 's|%%CTSCRIPT%% %F|/usr/bin/comictagger|g' \
    -i build-tools/ComicTagger.desktop
}

pkgver() {
  cd comictagger

  git describe --tags | sed 's/-/_/g'
}

build() {
  cd comictagger

  python -m build --wheel --no-isolation
}

package() {
  cd comictagger

  python -m installer --destdir="${pkgdir}" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rf "${pkgdir}/usr/lib/python${python_version}/site-packages/tests/"

  sed -e 's|/usr/local/share/comictagger/app.png|/usr/share/icons/comictagger.png|g' \
    -e 's|%%CTSCRIPT%% %F|/usr/bin/comictagger|g' \
    -i build-tools/ComicTagger.desktop

  install -Dm644 build-tools/ComicTagger.desktop "${pkgdir}"/usr/share/applications/comictagger.desktop
  install -Dm644 comictaggerlib/graphics/app.png "${pkgdir}"/usr/share/icons/comictagger.png
}
