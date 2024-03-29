# Maintainer: lanthora <lanthora at outlook dot com>
# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=uwebsockets
pkgname=uwebsockets
pkgver=20.62.0
pkgrel=1
pkgdesc="Simple, secure & standards compliant web server for the most demanding of applications"
url="https://github.com/uNetworking/uWebSockets"
license=('Apache')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v$pkgver.tar.gz"
        "uwebsockets.pc")
sha256sums=('03dfc8037cf43856a41e64bbc7fc5a7cf5e6369c9158682753074ecbbe09eed1'
            '5433dee099ea6f6fe97ef200cc19aadc71ca5066d7f5238070c25cd040dfb520')
depends=( usockets )

package() {
	cd "$srcdir/uWebSockets-$pkgver"
	install -Dm644 -t "$pkgdir"/usr/include/uWebSockets/ src/*.h
	install -Dm644 "$srcdir"/uwebsockets.pc "$pkgdir"/usr/lib/pkgconfig/uwebsockets.pc
}

#vim: syntax=sh
