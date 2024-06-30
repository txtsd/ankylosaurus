# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2024-04-18-1396
pkgname=radeon-gpu-profiler
pkgver=2.1
pkgrel=1
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug)
source=("https://gpuopen.com/download/radeon-developer-tool-suite/${_pkgname}.tgz")
sha512sums=('956f9cc4b6d61d5b710284221966db05344362e18e2523660d7f1d5b52c8039a9386c6ef87e5146b7354017604d51b00db7733f560145274bca4ef9b8c060b5d')
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
    printf '#!/usr/bin/env sh\nQT_QPA_PLATFORM= %s\n' "/opt/${pkgname}/${_binary}" > "$pkgdir/usr/bin/$_bin"
    chmod 0755 "$pkgdir/usr/bin/$_bin"
  done
}
