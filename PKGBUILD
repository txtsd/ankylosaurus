# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2024-06-26-1341
pkgname=radeon-gpu-profiler
pkgver=2.2
pkgrel=2
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug)
source=("https://gpuopen.com/download/radeon-developer-tool-suite/${_pkgname}.tgz")
sha512sums=('b82f98a0e8cbd6ccf36cc6e09e12f6b8bb9a854be22c99bff13419f831db582d68a9e783a8806a866b24d22d51ebe5be4c398d170eab35de5e7c7e67d892175d')
install=radeon-gpu-profiler.install

package()
{
  # copy to opt
  mkdir -p "${pkgdir}/opt/"
  cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${pkgname}/"

  # create launcher scripts (prepended with QT_QPA_PLATFORM= for wayland compat)
  declare -A _binaries=(
    RadeonGPUAnalyzer   rga
    RadeonGPUProfiler   rgp
  )

  mkdir -p "${pkgdir}/usr/bin/"
  for _binary in "${!_binaries[@]}"; do
    _bin="${_binaries[$_binary]}"
    printf '#!/usr/bin/env sh\nexport LD_LIBRARY_PATH=%s\nexec %s\n' \
      "/opt/${pkgname}/lib/" \
      "/opt/${pkgname}/${_binary}" > "$pkgdir/usr/bin/$_bin"
    chmod 0755 "$pkgdir/usr/bin/$_bin"
  done
}
