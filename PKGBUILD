# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2025-03-07-1606
pkgname=radeon-gpu-profiler
pkgver=2.4
pkgrel=1
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug !strip)
source=("https://gpuopen.com/download/radeon-developer-tool-suite/${_pkgname}.tgz")
sha512sums=('d245a22fbb3709b3f1fdbbf9cd13e4241dfba964c8defd7cb6a2b412839b6e035e2383cacfee51da97d802494b687d4f2735d403f2f2047e9e9fe72f7f9cabd0')
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
