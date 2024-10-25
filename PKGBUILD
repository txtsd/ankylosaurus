# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: neeshy <neeshy@tfwno.gf>

pkgname=ripme-bin
pkgver=2.1.11
_pkgver=2.1.10-21-c94a9543
pkgrel=1
pkgdesc='Downloads albums in bulk'
arch=('any')
url='https://github.com/ripmeapp2/ripme'
license=('MIT')
depends=('java-runtime>=17' 'bash')
provides=('ripme')
conflicts=('ripme')
source=("https://github.com/ripmeapp2/ripme/releases/download/${pkgver}/ripme-${_pkgver}.jar"
        "https://raw.githubusercontent.com/ripmeapp2/ripme/${pkgver}/LICENSE.txt")
sha256sums=('2104b9d8a83c2cef594fe8a972d07425cc134845f46f8d57cccd1c5557aeac4f'
            'f17abb5fb22a7dd6408518207f0f8e301322153585d9ad08941a0d498d7c4f9a')

package() {
  cd "${srcdir}"
  install -Dm644 "ripme-${_pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname%%-bin}}/ripme.jar"
  install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cat <<EOF | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ripme"
#!/bin/sh
exec java -jar /usr/share/java/${pkgname%%-bin}}/ripme.jar "\$@"
EOF
}
