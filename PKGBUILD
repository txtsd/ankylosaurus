# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>

_pkgname=RadeonDeveloperToolSuite-2025-10-29-1732
pkgname=radeon-gpu-profiler
pkgver=2.6
pkgrel=1
pkgdesc='A suite of GUI applications that provide detailed low-level information on Radeon GPUs. (rgp, rga)'
arch=('x86_64')
url="https://gpuopen.com/rgp/"
license=('MIT')
depends=('gcc-libs' 'sh')
options=(!debug !strip)
source=("https://gpuopen.com/download/${_pkgname}.tgz")
sha512sums=('c4a6ad1e42335ce4849b35c1f2677c77d08028e97be9241940d7f425117b8bd0233b3ff202f9b8ae465bf4e331f4c5854a1ec849f276be2d9169a34ec5e8927e')
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
