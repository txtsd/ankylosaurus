# Maintainer: Aanok (aanok.aur@gmail.com)
# Contributor: Parker Ellertson (rasputin-machine) <parker@rasputinmachine.com>
# Contributor: therealfarfetchd
pkgname='ripcord'
pkgver=0.3.12
pkgrel=1
pkgdesc='Qt-based Discord and Slack client'
arch=('x86_64')
depends=('fuse2')
url='https://cancel.fm/ripcord/'
license=('custom')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

_file="Ripcord-$pkgver-x86_64.AppImage"
source=("https://cancel.fm/dl/$_file"{,.asc})
sha256sums=('fb465d7b86541d985969ae482248a53e1824e4fb40fe51928d72124f3879f9a9' 'SKIP')

# !! AppImage is emptied if symbols are stripped away !!
# But beyond that, the program is deployed with symbols on purpose
options=('!strip')

# AppImage is already compressed, no reason to compress it again
# Kept as reminder
#PKGEXT='.pkg.tar'

prepare() {
  # Extract AppImage contents so we install bypassing every and all AppImage
  # desktop integration/deployment mechanisms
  chmod +x "$_file"
  "./$_file" --appimage-extract &>/dev/null
}

package() {
  # directories
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  
  # icon
  install -m644 squashfs-root/Ripcord_Icon.png "$pkgdir"/usr/share/icons/
  
  # .desktop file
  sed -i 's/Exec=Ripcord/Exec=\/usr\/bin\/ripcord/' squashfs-root/Ripcord.desktop
  install -m644 squashfs-root/Ripcord.desktop "$pkgdir"/usr/share/applications

  # license
  sed -i '1s/^/Copyright 2016 - 2019 Acyclic Systems LLC All Rights Reserved\n\n/' squashfs-root/additional_license_information.txt
  install -m644 squashfs-root/additional_license_information.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # application
  chmod 755 -R squashfs-root/lib squashfs-root/plugins squashfs-root/plugins/*
  mv squashfs-root/* "$pkgdir"/usr/lib/ripcord/
  ln -s /usr/lib/ripcord/Ripcord "$pkgdir"/usr/bin/ripcord
}
