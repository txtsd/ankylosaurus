# Maintainer: envolution
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Bin Jin <bjin@ctrl-d.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-magika
_name=magika-python
pkgver=1.0.3
pkgrel=1
pkgdesc="Detect file content types with deep learning"
arch=(any)
url="https://github.com/google/magika"
license=('Apache-2.0')
depends=(
  'python'
  'python-click'
  'python-dotenv'
  'python-numpy'
  'python-onnxruntime'
)
makedepends=(
  'cargo'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-maturin'
  'python-poetry'
  'python-wheel'
)
checkdepends=(
  'protobuf'
  'python-dacite'
  'python-pytest'
  'python-tqdm'
)
provides=(magika-cli)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/python-v${pkgver}.tar.gz")
sha256sums=('8d24d6638f30f4c89e5b71fd2f6dee665e5381215b8f9d1ba88b065e57edaff4')

prepare() {
  cd "${_name}-v${pkgver}"

  cd rust/cli
  cargo fetch --locked
}

build() {
  cd "${_name}-v${pkgver}"

  cd python
  python -m build --wheel --no-isolation

  cd ../rust/cli
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_name}-v${pkgver}"

  cd python
  # to run the cli test without installing, we need to change this VERSION constant to a try block
  # this won't modify our .whl file as it's already built
  sed -i '/^VERSION.*=/c\try:\n    VERSION = importlib.metadata.version("magika")\nexcept importlib.metadata.PackageNotFoundError:\n    VERSION = "unknown"' \
    src/magika/cli/magika_client.py

  PYTHONPATH="${PWD}/src" python -m pytest \
    -k "not test_magika_module_with_big_file" #needs about 12GB free space - disabled for CI purposes

  cd ../rust/cli
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${_name}-v${pkgver}"

  python -m installer --destdir="${pkgdir}" rust/target/wheels/*.whl
}
# vim:set ts=2 sw=2 et:
