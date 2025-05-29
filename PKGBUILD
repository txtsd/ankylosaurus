# Maintainer: envolution
# Contributor: Bin Jin <bjin@ctrl-d.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-magika
_name=magika
pkgver=0.6.2
pkgrel=2
pkgdesc="Detect file content types with deep learning"
arch=(any)
url="https://github.com/google/magika"
license=('Apache-2.0')
depends=('python' 'python-click' 'python-onnxruntime' 'python-numpy' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-poetry')
checkdepends=('git' 'protobuf' 'python-dacite' 'python-pytest' 'python-tqdm')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('37eb6ae8020f6e68f231bc06052c0a0cbe8e6fa27492db345e8dc867dbceb067')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  #pypi's tarball doesn't include some of the test data required to run the full test suite
  #clone it only if the user requests the check process
  rm -rf $srcdir/magika-tests ${srcdir}/${_name}-${pkgver}/tests_data
  git clone --filter=blob:none --no-checkout https://github.com/google/magika.git $srcdir/magika-tests
  cd $srcdir/magika-tests
  git sparse-checkout init --cone
  git sparse-checkout set tests_data
  git checkout "python-v$pkgver"
  
  cd "$srcdir/${_name}-${pkgver}"
  # to run the cli test without installing, we need to change this VERSION constant to a try block
  # this won't modify our .whl file as it's already built
  sed -i '/^VERSION.*=/c\try:\n    VERSION = importlib.metadata.version("magika")\nexcept importlib.metadata.PackageNotFoundError:\n    VERSION = "unknown"' \
		src/magika/cli/magika_client.py

  cp -rf "$srcdir/magika-tests/tests_data" ../tests_data
  PYTHONPATH="$PWD/src" python -m pytest \
    -k "not test_magika_module_with_big_file" #needs about 12GB free space - disabled for CI purposes
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
