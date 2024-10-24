# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=opennox
pkgver=1.9.0_alpha13
pkgrel=1
pkgdesc='A modern implementation of the Nox game engine'
arch=('x86_64')
url='https://github.com/noxworld-dev/opennox'
license=('GPL-3.0-or-later')
depends=('lib32-sdl2' 'lib32-libglvnd' 'lib32-glibc' 'lib32-openal'
         'hicolor-icon-theme')
makedepends=('git' 'go' 'gcc-multilib' 'lib32-sdl_image')
options=(!debug)
source=("git+${url}#tag=v${pkgver//_/-}"
        "explicit_type_cast.patch")
sha256sums=('5b7ff814c4ac78fabb49f2160d710712fbe0c48c1b4371602a88239b60926bb3'
            'bdd8b37ef814a44c890e4992dfcc1d5bf5731080df87553537041ae1484adf8a')

prepare() {
    cd "${pkgname}"
    patch -Np1 -i "${srcdir}/explicit_type_cast.patch"
}

build() {
    cd "${pkgname}/src"
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    # Fails to build without this
    export CGO_CFLAGS+=" -Wno-format-security"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go run ./internal/noxbuild -o build
}

package() {
    cd "${pkgname}/src/build"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${pkgname}-hd" "${pkgdir}/usr/bin/${pkgname}-hd"
    install -Dm755 "${pkgname}-server" "${pkgdir}/usr/bin/${pkgname}-server"
    local fqpn="io.github.noxworld_dev.OpenNox"
    install -Dm644 "${srcdir}/${pkgname}/app/${fqpn}.desktop" "${pkgdir}/usr/share/applications/${fqpn}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/app/${fqpn}.HD.desktop" "${pkgdir}/usr/share/applications/${fqpn}.HD.desktop"
    install -Dm644 "${srcdir}/${pkgname}/app/${fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${fqpn}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}/res/${pkgname}_256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${fqpn}.png"
    install -Dm644 "${srcdir}/${pkgname}/res/${pkgname}_512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${fqpn}.png"
}

