# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.18
_pkgver=2.1.18-16-1342b621
pkgrel=1
pkgdesc='Downloads albums in bulk'
arch=(any)
url='https://github.com/RipMeApp/ripme'
license=('MIT')
depends=(
  'java-runtime>=17'
  bash
)
makedepends=(
  'java-environment>=17'
  git
  gradle
)
options=(!debug)
source=("git+${url}#tag=${_pkgver}")
sha256sums=('b8e2a7df8da746c268b34054f076bb5df5aa60aa2604f870c10f4a4d7f25b8bf')

build() {
  cd "${pkgname}"

  CURRENT_JAVA_VERSION=$(archlinux-java get | grep -P "\d+" -o)
  gradle clean build -PjavacRelease=${CURRENT_JAVA_VERSION} -PcustomVersion=${_pkgver} -x test
  cat << EOF > ripme.sh
#!/bin/sh
exec java -jar /usr/share/java/${pkgname}/ripme.jar "\$@"
EOF
}

package() {
  cd "${pkgname}"

  install -Dm644 "build/libs/ripme-${_pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/ripme.jar"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 ripme.sh "${pkgdir}/usr/bin/ripme"
}
