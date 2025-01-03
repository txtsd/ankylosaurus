# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme-bin
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
provides=(ripme)
conflicts=(ripme)
options=(!debug)
source=(
  "${url}/releases/download/${_pkgver}/ripme-${_pkgver}.jar"
  "${url}/raw/${_pkgver}/LICENSE.txt"
)
sha256sums=('196e0048aaf742ac44840675b46907502a144a0b3d27402e7666c29e94aea185'
            'f17abb5fb22a7dd6408518207f0f8e301322153585d9ad08941a0d498d7c4f9a')

package() {
  cd "${srcdir}"

  install -Dm644 "ripme-${_pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%-bin}/ripme.jar"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cat << EOF | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/${pkgname%-bin}/ripme.jar "\$@"
EOF
}
