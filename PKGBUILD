# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=flaresolverr-bin
_pkgname=flaresolverr
__pkgname=FlareSolverr
pkgver=3.3.17
pkgrel=1
pkgdesc='A proxy server to bypass Cloudflare protection'
arch=('x86_64')
url='https://github.com/FlareSolverr/FlareSolverr'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'bzip2' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'libcups' 'libdrm'
         'libffi' 'libx11' 'libxcb' 'libxkbcommon' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'mesa' 'nspr' 'nss' 'openssl' 'pango' 'readline' 'util-linux-libs' 'xorg-server-xvfb' 'xz' 'zlib')
conflicts=("${_pkgname}")
options=('!strip')
install='flaresolverr.install'
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/${__pkgname}/${__pkgname}/releases/download/v${pkgver}/${_pkgname}_linux_x64.tar.gz"
        "https://raw.githubusercontent.com/${__pkgname}/${__pkgname}/v${pkgver}/LICENSE"
        "flaresolverr.service"
        "flaresolverr.sysusers"
        "flaresolverr.tmpfiles"
        "flaresolverr.install")
sha256sums=('658f2cc9ea232274aa8da29273ba7cf09e151fdf200b3bd3082aa1d3915b3a4c'
            '822369fb1f97651e6d0b00128451987e0ce98adc3007dc886db68adbf891d2da'
            'aaf9f1fd58b98583b2e5d2c9e2e0ceb31649a8d7034241833a0463861fbe00eb'
            '62f114d4e559cf9dae22bfd90759eff697e42da5f700a52988e70e78f3048ae2'
            '4a61a6d9db1a9f4ec0812d86ef524a7f575a45f272404f0ebfc79376628feeb2'
            'f3585f385fe8dd2d619144b8e666f1883d3501ce05d81e7c3ed4a57f0d093e85')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/opt/flaresolverr"
    cp -a "${_pkgname}" "${pkgdir}/opt"
    rm "${pkgdir}/opt/flaresolverr/libreadline.so.8"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "flaresolverr.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

    install -Dm644 "flaresolverr.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -Dm644 "flaresolverr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
