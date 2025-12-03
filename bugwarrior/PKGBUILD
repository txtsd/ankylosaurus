# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=2.0.0
pkgrel=2
pkgdesc='Pull github, bitbucket, and trac issues into taskwarrior'
arch=(any)
url='https://bugwarrior.readthedocs.io'
license=('GPL-3.0-or-later')
depends=(
  python
  python-click
  python-dateutil
  python-dogpile.cache
  python-ini2toml
  python-jinja
  python-lockfile
  python-pydantic
  python-pytz
  python-requests
  python-taskw
  python-tomli
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-bugzilla: bugzilla support'
  'python-debianbts: bts support'
  'python-google-api-python-client: gmail support'
  'python-jira: jira support'
  'python-keyring: keyring support'
  'python-oauth2client: gmail support'
  'python-offtrac: Trac support'
  'python-phabricator: phabricator support'
  'python-pysimplesoap: bts support'
)
options=(!debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GothenburgBitFactory/bugwarrior/archive/${pkgver}.tar.gz")
sha256sums=('403cb62b27cab97c8cd478a09fe01ff16a391a6a1a458f1f746a12a65d49753e')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
