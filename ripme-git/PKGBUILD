# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Julien Machiels <julien.machiels@protonmail.com>
# Contributor: Erik Sonnleitner <es@delta-xi.net>

_pkgname=ripme
pkgname="${_pkgname}-git"
pkgver=2.1.11.r2.g31c71f44
pkgrel=1
pkgdesc="Downloads albums in bulk"
arch=('any')
url="https://github.com/ripmeapp2/ripme"
license=('MIT')
depends=('java-runtime>=17')
makedepends=(
  'git'
  'gradle'
  'java-environment>=17'
)
provides=('ripme')
conflicts=('ripme')
source=('git+https://github.com/ripmeapp2/ripme.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always --tags --exclude="latest-main" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  CURRENT_JAVA_VERSION=$(archlinux-java get | grep -P "\d+" -o)
  rver=$(git describe --always --tags --exclude="latest-main" | sed 's/-g/-/')
  gradle clean build -PjavacRelease=${CURRENT_JAVA_VERSION} -PcustomVersion=${rver} -x test
  cat <<EOF >ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/${pkgname%%-git}/ripme.jar "\$@"
EOF
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 build/libs/ripme-*.jar "${pkgdir}/usr/share/java/${pkgname%%-git}/ripme.jar"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
