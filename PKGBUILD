# Maintainer: Lenny McLennington <lenny@sneed.church>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=prismlauncher-qt5-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('x86_64')
url="https://github.com/PlaceholderMC/PlaceholderMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('polymc' 'polymc-qt5')
conflicts=('polymc' 'polymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PlaceholderMC/PlaceholderMC/releases/download/${pkgver}/PlaceholderMC-Linux-${pkgver}.tar.gz")
noextract=("PlaceholderMC-Linux-${pkgver}.tar.gz")
sha256sums=('27c0efa28013d24d3713989e2610f2fa268a9a315bdf83f2316560fa7b529050')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PlaceholderMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}
