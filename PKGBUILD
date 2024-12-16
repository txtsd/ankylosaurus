# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2024-09-26-1411
pkgname=radeon-gpu-profiler
pkgver=2.3
pkgrel=4
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug)
source=("https://gpuopen.com/download/radeon-developer-tool-suite/${_pkgname}.tgz")
sha512sums=('cb4525bd813120752bef3bc84275b9ca6adce256fff1af0cba627b80e95c69fdac76af2aaba4d56b607c7b7d9e908a774ebd9d1fbb8d053d3aa2625b9a313e3a')
install=radeon-gpu-profiler.install

package()
{
  # copy to opt
  mkdir -p "${pkgdir}/opt/"
  cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin/"

  # create launcher scripts
  # (prepended with QT_QPA_PLATFORM= for wayland compat)

  local binaries=(
    RadeonDeveloperPanel
    RadeonGPUAnalyzer
    RadeonGPUProfiler
    RadeonMemoryVisualizer
    RadeonRaytracingAnalyzer
    )

  for _binary in "${binaries[@]}"
  do
    cat > "$pkgdir/usr/bin/$_binary"<< EOF
#!/usr/bin/env sh
export LD_LIBRARY_PATH=/opt/${pkgname}/lib/
export QT_QPA_PLATFORM=
exec /opt/${pkgname}/${_binary}
EOF

    chmod 0755 "$pkgdir/usr/bin/$_binary"
  done
}
