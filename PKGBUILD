# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=2.1.0
pkgrel=1
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
sha256sums=('d78830164689a91e2c2611b7533f92e16f9d3bd9842dfb1575b22c1db1e5d024')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
