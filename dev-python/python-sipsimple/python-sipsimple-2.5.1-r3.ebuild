# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="SIP SIMPLE client SDK is a Software Development Kit"
HOMEPAGE="http://sipsimpleclient.org"
SRC_URI="https://github.com/AGProjects/${PN}/archive/release-${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
IUSE="libressl"

KEYWORDS="~*"

CDEPEND="
	dev-db/sqlite:3
	!libressl? ( dev-libs/openssl:0[-bindist] )
	libressl? ( dev-libs/libressl )
	dev-python/python-application[${PYTHON_USEDEP}]
	media-libs/alsa-lib
	media-libs/libv4l
	media-libs/libvpx
	sys-apps/util-linux
	virtual/ffmpeg
"
RDEPEND="${CDEPEND}
	virtual/python-dnspython[${PYTHON_USEDEP}]
	dev-python/python-cjson[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/python-eventlib[${PYTHON_USEDEP}]
	dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/python-gnutls[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/python-msrplib[${PYTHON_USEDEP}]
	dev-python/python-xcaplib[${PYTHON_USEDEP}]
	dev-python/twisted-core[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
DEPEND="${CDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	virtual/pkgconfig
"

PATCHES=( "${FILESDIR}/${PN}-2.x-PixelFormat-fix.patch" )

S="${WORKDIR}/${PN}-release-${PV}"

src_prepare() {
	# Fix missing execution permission
	chmod u+x deps/pjsip/configure
	chmod u+x deps/pjsip/aconfigure
	default
}
