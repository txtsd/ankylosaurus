# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme
pkgver=2.1.12
_pkgver=2.1.11-20-ca96ce88
pkgrel=1
pkgdesc='Downloads albums in bulk'
arch=(any)
url='https://github.com/ripmeapp2/ripme'
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
source=("git+${url}#tag=${pkgver}")
sha256sums=('5a5310c938beb58b9795203782e845dca4f8c8461a8784fa881aa231916283ff')

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
