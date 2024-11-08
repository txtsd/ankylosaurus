# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>

# TODO add test, see about packaging jtreg and using it here

pkgbase=java-openjdk-wakefield
pkgname=('jre-openjdk-wakefield-headless' 'jre-openjdk-wakefield' 'jdk-openjdk-wakefield' 'openjdk-wakefield-src' 'openjdk-wakefield-doc')
# on a majorver change, don't forget to update the misc files that come along this PKGBUILD
_majorver=21
_minorver=0
_securityver=1
_updatever=0
pkgver=21.0.1.0.r274.g9758078
pkgrel=1
_git_tag=jdk-${_majorver}.${_minorver}.${_securityver}+${_updatever}
arch=('x86_64')
url='https://openjdk.org/projects/wakefield/'
license=('GPL-2.0-or-later')
makedepends=('java-environment=21' 'cpio' 'unzip' 'zip' 'libelf' 'libcups' 'libx11'
             'libxrender' 'libxtst' 'libxt' 'libxext' 'libxrandr' 'alsa-lib' 'pandoc'
             'graphviz' 'freetype2' 'libjpeg-turbo' 'giflib' 'libpng' 'lcms2'
             'libnet' 'bash' 'harfbuzz' 'gcc-libs' 'glibc' 'git' 'wayland')
optdepends=('gvfs: open links e.g. hyperlinks')
source=("git+https://github.com/openjdk/wakefield.git#branch=jdk21.0.1-wayland"
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('SKIP'
            '72111743ab6ab36854b0c85a504172983715d0798fce10bc4e35689b7d15fd93'
            '8ecdf5c1605bafa58b3f7da615e6d8d3d943e3a2d3831930d6efa7815aacce07'
            '50fc0d677489b73d549df2f08d759d5f057f200adbbab83ea5e87456152ee03e')

case "${CARCH}" in
  x86_64) _JARCH='x86_64' ;;
  i686)   _JARCH='x86' ;;
esac

_jvmdir=/usr/lib/jvm/java-${_majorver}-openjdk-wakefield
_jdkdir=wakefield
_imgdir=${_jdkdir}/build/linux-${_JARCH}-server-release/images

_nonheadless=(lib/libawt_xawt.so
              lib/libjawt.so
              lib/libjsound.so
              lib/libsplashscreen.so)

_commondeps=('java-runtime-common>=3' 'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'libjpeg.so'
           'lcms2' 'liblcms2.so' 'libnet' 'freetype2' 'libfreetype.so' 'harfbuzz' 'libharfbuzz.so'
           'glibc' 'gcc-libs' 'wayland')

pkgver() {
  cd ${_jdkdir}

  printf "${_majorver}.${_minorver}.${_securityver}.${_updatever}.r%s.g%s" "$(git rev-list --count jdk-21-ga..HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_jdkdir}

  NUM_PROC_OPT=''
  MAKEFLAG_J=$(echo ${MAKEFLAGS} | sed -En 's/.*-j([0-9]+).*/\1/p')
  if [ -n "${MAKEFLAG_J}" ]; then
    # http://hg.openjdk.java.net/jdk10/jdk10/file/85e6cb013b98/make/InitSupport.gmk#l105
    echo "Removing '-j${MAKEFLAG_J}' from MAKEFLAGS to prevent build fail. Passing it directly to ./configure."
    export MAKEFLAGS=${MAKEFLAGS/-j${MAKEFLAG_J}/}
    NUM_PROC_OPT="--with-num-cores=${MAKEFLAG_J}"
  fi

  # Avoid optimization of HotSpot to be lowered from O3 to O2
  local _CFLAGS="${CFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _CXXFLAGS="${CXXFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _LDFLAGS=${LDFLAGS}
  if [[ ${CARCH} = i686 ]]; then
    echo "Removing '-fno-plt' from CFLAGS and CXXFLAGS to prevent build fail with this architecture"
    _CFLAGS=${CFLAGS/-fno-plt/}
    _CXXFLAGS=${CXXFLAGS/-fno-plt/}
  fi

  # TODO: Should be rechecked for the next releases
  # compiling with -fexceptions leads to:
  # /usr/bin/ld: /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/build/linux-x86_64-server-release/hotspot/variant-server/libjvm/objs/zPhysicalMemory.o: in function `ZList<ZMemory>::~ZList()':
  # /build/java-openjdk/src/jdk17u-jdk-17.0.3-2/src/hotspot/share/gc/z/zList.hpp:54: undefined reference to `ZListNode<ZMemory>::~ZListNode()'
  # collect2: error: ld returned 1 exit status
  _CFLAGS=${CFLAGS/-fexceptions/}
  _CXXFLAGS=${CXXFLAGS/-fexceptions/}

  # CFLAGS, CXXFLAGS and LDFLAGS are ignored as shown by a warning
  # in the output of ./configure unless used like such:
  #  --with-extra-cflags="${CFLAGS}"
  #  --with-extra-cxxflags="${CXXFLAGS}"
  #  --with-extra-ldflags="${LDFLAGS}"
  # See also paragraph "Configure Control Variables from "jdk${_majorver}-${_git_tag}/common/doc/building.md
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  if check_option "lto" "y"; then
    jvm_features="zgc,shenandoahgc,link-time-opt"
  else
    jvm_features="zgc,shenandoahgc"
  fi

  # Unset any locally set _JAVA_OPTIONS
  unset _JAVA_OPTIONS

  bash configure \
    --with-version-build="${_updatever}" \
    --with-version-pre="" \
    --with-version-opt="" \
    --with-stdc++lib=dynamic \
    --with-extra-cflags="${_CFLAGS}" \
    --with-extra-cxxflags="${_CXXFLAGS}" \
    --with-extra-ldflags="${_LDFLAGS}" \
    --with-libjpeg=system \
    --with-giflib=system \
    --with-libpng=system \
    --with-lcms=system \
    --with-zlib=system \
    --with-harfbuzz=system \
    --with-jvm-features="${jvm_features}" \
    --with-native-debug-symbols=internal \
    --enable-unlimited-crypto \
    --disable-warnings-as-errors \
    --with-vendor-name="Arch Linux" \
    ${NUM_PROC_OPT}
    #--disable-javac-server

  make images legacy-jre-image docs

  # https://bugs.openjdk.java.net/browse/JDK-8173610
  find "${srcdir}/${_imgdir}" -iname '*.so' -exec chmod +x {} \;
}

check() {
  cd ${_jdkdir}
  # TODO package jtreg
  # make -k check
}

package_jre-openjdk-wakefield-headless() {
  pkgdesc="OpenJDK Java ${_majorver} wayland headless runtime environment"
  depends=("${_commondeps[@]}")
  optdepends=('java-rhino: for some JavaScript support')
  provides=("java-runtime-headless=${_majorver}" "java-runtime-headless-openjdk=${_majorver}" "jre${_majorver}-openjdk-wakefield-headless=${pkgver}-${pkgrel}")
  conflicts=("jdk-openjdk-wakefield" "jre-openjdk-wakefield")
  backup=(etc/${pkgbase}/logging.properties
          etc/${pkgbase}/management/jmxremote.access
          etc/${pkgbase}/management/jmxremote.password.template
          etc/${pkgbase}/management/management.properties
          etc/${pkgbase}/net.properties
          etc/${pkgbase}/security/java.policy
          etc/${pkgbase}/security/java.security
          etc/${pkgbase}/security/policy/README.txt
          etc/${pkgbase}/security/policy/limited/default_US_export.policy
          etc/${pkgbase}/security/policy/limited/default_local.policy
          etc/${pkgbase}/security/policy/limited/exempt_local.policy
          etc/${pkgbase}/security/policy/unlimited/default_US_export.policy
          etc/${pkgbase}/security/policy/unlimited/default_local.policy
          etc/${pkgbase}/sound.properties)
  install=install_jre-openjdk-headless.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    rm "${pkgdir}${_jvmdir}/${f}"
  done

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgbase}"
  ln -s /etc/${pkgbase} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/${pkgbase} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-openjdk-wakefield${_majorver}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}

package_jre-openjdk-wakefield() {
  pkgdesc="OpenJDK Java ${_majorver} wayland full runtime environment"
  depends=("${_commondeps[@]}" 'giflib' 'libgif.so' 'libpng')
  optdepends=('alsa-lib: for basic sound support'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
  provides=("java-runtime=${_majorver}" "java-runtime-openjdk=${_majorver}" "jre${_majorver}-openjdk-wakefield=${pkgver}-${pkgrel}"
            "java-runtime-headless=${_majorver}" "java-runtime-headless-openjdk=${_majorver}" "jre${_majorver}-openjdk-wakefield-headless=${pkgver}-${pkgrel}")
  conflicts=("jdk-openjdk-wakefield" "jre-openjdk-wakefield-headless")
  backup=(etc/${pkgbase}/logging.properties
          etc/${pkgbase}/management/jmxremote.access
          etc/${pkgbase}/management/jmxremote.password.template
          etc/${pkgbase}/management/management.properties
          etc/${pkgbase}/net.properties
          etc/${pkgbase}/security/java.policy
          etc/${pkgbase}/security/java.security
          etc/${pkgbase}/security/policy/README.txt
          etc/${pkgbase}/security/policy/limited/default_US_export.policy
          etc/${pkgbase}/security/policy/limited/default_local.policy
          etc/${pkgbase}/security/policy/limited/exempt_local.policy
          etc/${pkgbase}/security/policy/unlimited/default_US_export.policy
          etc/${pkgbase}/security/policy/unlimited/default_local.policy
          etc/${pkgbase}/sound.properties)
  install=install_jre-openjdk.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    install -Dm 755 ${f} "${pkgdir}${_jvmdir}/${f}"
  done

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgbase}"
  ln -s /etc/${pkgbase} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/${pkgbase} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-openjdk-wakefield${_majorver}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Desktop files
  for f in java; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgbase}.desktop"
  done
}

package_jdk-openjdk-wakefield() {
  pkgdesc="OpenJDK Java ${_majorver} wayland development kit"
  depends=("${_commondeps[@]}" 'java-environment-common=3'
           'hicolor-icon-theme' 'libelf' 'libgif.so' 'libpng'
           'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'libjpeg.so'
           'lcms2' 'liblcms2.so' 'libnet' 'freetype2' 'libfreetype.so' 'harfbuzz'
           'libharfbuzz.so')
  optdepends=('java-rhino: for some JavaScript support'
              'alsa-lib: for basic sound support'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
  provides=("java-environment=${_majorver}" "java-environment-openjdk=${_majorver}" "jdk${_majorver}-openjdk-wakefield=${pkgver}-${pkgrel}"
            "java-runtime=${_majorver}" "java-runtime-openjdk=${_majorver}" "jre${_majorver}-openjdk-wakefield=${pkgver}-${pkgrel}"
            "java-runtime-headless=${_majorver}" "java-runtime-headless-openjdk=${_majorver}" "jre${_majorver}-openjdk-wakefield-headless=${pkgver}-${pkgrel}")
  conflicts=("jre-openjdk-wakefield" "jre-openjdk-wakefield-headless")
  backup=(etc/${pkgbase}/logging.properties
          etc/${pkgbase}/management/jmxremote.access
          etc/${pkgbase}/management/jmxremote.password.template
          etc/${pkgbase}/management/management.properties
          etc/${pkgbase}/net.properties
          etc/${pkgbase}/security/java.policy
          etc/${pkgbase}/security/java.security
          etc/${pkgbase}/security/policy/README.txt
          etc/${pkgbase}/security/policy/limited/default_US_export.policy
          etc/${pkgbase}/security/policy/limited/default_local.policy
          etc/${pkgbase}/security/policy/limited/exempt_local.policy
          etc/${pkgbase}/security/policy/unlimited/default_US_export.policy
          etc/${pkgbase}/security/policy/unlimited/default_local.policy
          etc/${pkgbase}/sound.properties)
  install=install_jdk-openjdk.sh

  cd ${_imgdir}/jdk

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin demo include jmods lib release "${pkgdir}${_jvmdir}"

  rm "${pkgdir}${_jvmdir}/lib/src.zip"

    # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${pkgbase}"
  ln -s /etc/${pkgbase} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/licenses/${pkgbase} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in bin/*; do
    f=$(basename "${f}")
    _man=../jdk/man/man1/"${f}.1"
    test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-openjdk-wakefield${_majorver}.1"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"

  # Icons
  for s in 16 24 32 48; do
    install -Dm 644 \
      "${srcdir}/${_jdkdir}/src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${pkgbase}.png"
  done

  # Desktop files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${pkgbase}.desktop"
  done
}

package_openjdk-wakefield-src() {
  pkgdesc="OpenJDK Java ${_majorver} wayland sources"
  arch=('any')
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openjdk-wakefield=${pkgver}-${pkgrel}")
  provides=("openjdk${_majorver}-src=${pkgver}-${pkgrel}")

  install -Dm 644 -t "${pkgdir}${_jvmdir}/lib" ${_imgdir}/jdk/lib/src.zip

  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_openjdk-wakefield-doc() {
  pkgdesc="OpenJDK Java ${_majorver} wayland documentation"
  arch=('any')
  # Depends on JDK to get license files
  depends=("jdk${_majorver}-openjdk-wakefield=${pkgver}-${pkgrel}")
  provides=("openjdk${_majorver}-doc=${pkgver}-${pkgrel}")

  install -dm 755 "${pkgdir}/usr/share/doc"
  cp -r ${_imgdir}/docs "${pkgdir}/usr/share/doc/${pkgbase}"

  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
