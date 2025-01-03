# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>
# Contributor: Julien Machiels <julien.machiels@protonmail.com>
# Contributor: Erik Sonnleitner <es@delta-xi.net>

pkgname=ripme-git
_pkgname="${pkgname%-git}"
pkgver=2.1.14.r1.g2621a273
pkgrel=1
pkgdesc='Downloads albums in bulk'
arch=(any)
url='https://github.com/RipMeApp/ripme'
license=('MIT')
depends=(bash 'java-runtime>=17')
makedepends=(
  'java-environment>=17'
  git
  gradle
)
provides=(ripme)
conflicts=(ripme)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --always --tags --exclude="latest-main" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  CURRENT_JAVA_VERSION=$(archlinux-java get | grep -P "\d+" -o)
  rver=$(git describe --always --tags --exclude="latest-main" | sed 's/-g/-/')
  gradle clean build -PjavacRelease=${CURRENT_JAVA_VERSION} -PcustomVersion=${rver} -x test
  cat << EOF > ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/${pkgname%-git}/ripme.jar "\$@"
EOF
}

package() {
  cd "${_pkgname}"

  install -Dm644 build/libs/ripme-*.jar "${pkgdir}/usr/share/java/${pkgname%-git}/ripme.jar"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
