# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: brokenpip3 <brokenpip3[at]gmail[dot]com>

pkgname=gpt-engineer
pkgver=0.3.1
pkgrel=2
pkgdesc='Specify what you want it to build, the AI asks for clarification, and then builds it.'
arch=(any)
url='https://github.com/gpt-engineer-org/gpt-engineer'
license=('MIT')
depends=(
  'python>=3.10'
  python-backoff
  python-black
  python-dataclasses-json
  python-dotenv
  python-langchain
  python-langchain-community
  python-openai
  python-pyperclip
  python-regex
  python-tabulate
  python-termcolor
  python-tiktoken
  python-toml
  python-tomlkit
  python-typer
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
install=gpt-engineer.install
source=("https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname/-/_}-${pkgver}.tar.gz")
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7646c8421a47a12a4e6114c184f40a2e6c2f9fad3af03cf7ed9eb34a545eae0')

build() {
  cd "${pkgname/-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname/-/_}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
