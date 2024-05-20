# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-community
_pkgname=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
url='https://github.com/langchain-ai/langchain'
depends=(python
    python-aiohttp
    python-dataclasses-json
    python-langchain-core
    python-langsmith
    python-numpy
    python-yaml
    python-requests
    python-sqlalchemy
    python-tenacity
    python-tiktoken
    python-lxml
    python-steam
    python-google-auth
    python-psycopg2
    python-feedparser
    python-pytube
    python-beautifulsoup4
    python-redis
    python-html2text
    python-pychm
    python-google-auth-oauthlib
    python-scikit-learn
    python-reportlab
    python-pyparsing
    python-websocket-client
    python-google-api-python-client
    python-googleapis-common-protos
    python-pillow
    python-chardet
    python-xmltodict
    python-magic
    python-joblib
    yt-dlp
    python-grpcio
    python-selenium
    python-google-api-core
    python-pygithub
    python-protobuf
    python-pytz
    python-openai
    python-packaging
    python-tqdm
    python-jsonpatch
    python-tomli
    python-typing_extensions
    python-pandas
    python-httpx
    python-urllib3
    python-psutil
    python-requests-toolbelt
    python-pypdf
    python-boto3
    python-botocore
    python-tree-sitter
    python-tree-sitter-languages-bin
    python-pyjwt
    python-mypy_extensions
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
_src_name="${_pkgname%%-*}-${_pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/langchain-community==${pkgver}.tar.gz")
sha256sums=('91c53acf4eff3da09e78d43f3ed4b99ea36ba8ec50e8fc2fd75248421a9b64b8')

build() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}/libs/${_pkgname#langchain-}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/${_src_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
