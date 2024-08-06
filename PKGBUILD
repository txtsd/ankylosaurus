# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=aleo-fonts
pkgver=2.0
pkgrel=1
pkgdesc="Slab serif type family designed by Alessio Laiso"
url="https://alessiolaiso.com/aleo-font"
arch=(any)
license=(custom)
source=("https://alessiolaiso.com/downloads/Aleo_v$pkgver.zip")
sha512sums=('da1d87bec966be89e12db2013c6696e11754c75edc356280ed457bda3dff48c3065cc80f476150aeb33c68e85f8769a60217e082f1437441e7984d090126b349')

package() {
	cd "Aleo_v$pkgver/"
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "otf"/*.otf
	install -Dm644 "SIL Open Font License 1.1.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
