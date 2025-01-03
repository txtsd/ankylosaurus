# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.13
_pkgver=2.1.13-7-fac3f8ea
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
sha256sums=('4154a38c8f2f927011364e5e3cd7f7e733fd7817cbb5580a4258db0aadbe5436')

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
