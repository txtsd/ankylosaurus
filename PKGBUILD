# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=thesage
pkgver=0.36.3024
pkgrel=1
pkgdesc='English Dictionary and Thesaurus. A twenty-first century lexical reference system.'
arch=('x86_64')
url='https://www.sequencepublishing.com/1/burbridge/beta_linux.html'
license=('All Rights Reserved')
depends=('dotnet-runtime-3.1')
source=("$pkgname-$pkgver.zip::https://www.sequencepublishing.com/cgi-bin/download.cgi?burbridgelinux"
        "$pkgname.desktop"
        "$pkgname.png")
sha512sums=('faa52fa21093296f47e9e72636df5e914cf9c26c41f60e0def5a919d615b270fe7b22bd4367036929dba87c8cd8f8bba5731089709dc30a359521b9b02649c86'
            '9b7449ba7b3066be4fae5696011e4ff204d2f4e77750d110d46f5bfb04c8021957eaecdad61ffbafedec0e9c638a80e8ad7fe1ee3d5dedc6d5f7b6976a8e564b'
            '0ef714c8063eaa3abe730015acbdb976dadb6acdfb583df35bcf9ef15b5a0d27e48f42fec579b416fe8552a85b721b1f7ba1915d507594d870fe411b40d78aaf')

package() {
    cd "${pkgdir}"

    install -dm755 "opt/${pkgname}"
    install -dm755 "usr/bin"

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    rm "${srcdir}/${pkgname}-${pkgver}.zip"
    rm "${srcdir}/${pkgname}.desktop"
    rm "${srcdir}/${pkgname}.png"
    rm "${srcdir}/Burbridge.desktop"
    rm "${srcdir}/Burbridge.icon"

    cp -a "${srcdir}/"* "${pkgdir}/opt/${pkgname}"

    cat > "${pkgdir}/usr/bin/thesage" << EOF
#!/bin/sh
dotnet /opt/thesage/Burbridge.dll
EOF
    chmod +x "${pkgdir}/usr/bin/thesage"
}
