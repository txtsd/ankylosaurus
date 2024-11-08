# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=thesage
pkgver=0.40.3028
pkgrel=1
pkgdesc='English Dictionary and Thesaurus. A twenty-first century lexical reference system.'
arch=(x86_64)
url='https://www.sequencepublishing.com/1/burbridgebeta_linux.html'
license=('LicenseRef-thesage')
depends=(
  bash
  gcc-libs
  glibc
  zlib
)
makedepends=(unzip)
options=(!strip !debug)
noextract=("${pkgname}-${pkgver}.zip")
source=(
  "${pkgname}-${pkgver}.zip::https://www.sequencepublishing.com/cgi-bin/download.cgi?burbridgelinux"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha256sums=('a9948c03e3c6600a1522f8b899fd97cdb56d9927bf8f8cc25b55605fcb3294dd'
            'f8a25d201a455c45455a3f9b8eeae5c00198752fa7dbbf247d9c17f0ea816925'
            '00d663f565810bee13d7bda68db577389e215c2424a59a828625eb05a4ecd099')

prepare() {
  # Extract
  unzip -q "${pkgname}-${pkgver}.zip" -d "${pkgname}"
}

package() {
  cd "${pkgname}"

  # World writeable directory needed to write config file
  install -dm777 "${pkgdir}/opt/${pkgname}"

  # Data and executable
  for i in $(seq -f "%04g" 0 11); do
    install -Dm644 "${i}.dat" -t "${pkgdir}/opt/${pkgname}"
  done
  install -Dm755 Burbridge.exe "${pkgdir}/opt/${pkgname}/Burbridge.exe"

  # Images
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Symlink to binary
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/Burbridge.exe" "${pkgdir}/usr/bin/thesage"
}
