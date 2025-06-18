# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2025-06-12-1681
pkgname=radeon-gpu-profiler
pkgver=2.5
pkgrel=1
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug !strip)
source=("https://gpuopen.com/download/radeon-developer-tool-suite/${_pkgname}.tgz")
sha512sums=('1e65bfe5a9a9c3de269385d8046cd0cac2fa70547797b73b3e94c1431a451ef2a8bed93daf8cccd26ced7cb7cb67eaf372cd9a25da905a1b58165abe0a70ade6')
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
