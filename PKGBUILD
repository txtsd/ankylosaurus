# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Patrycja Rosa <alpine@ptrcnull.me>
# See: https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/bsd-compat-headers/APKBUILD

pkgname=bsd-compat-headers
pkgver=0.7.2
pkgrel=1
pkgdesc='BSD compatibility headers (cdefs, queue, tree)'
url='https://gitlab.alpinelinux.org/alpine/aports'
arch=('any')
license=('BSD-2-Clause AND BSD-3-Clause')
source=(
	cdefs.h
	queue.h
	tree.h
)
sha256sums=('15b1dd86710a4c5fc0654dbd871965b227474eb7f54531eebafffe8c1061f10e'
            'c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b'
            'e0ea17940260f9c1fdd2d35f74eec141d21f09844eaea91131993cb950901a16')

package() {
	cd ${srcdir}
	install -Dm644 cdefs.h queue.h tree.h -t "$pkgdir"/usr/include/sys
}

