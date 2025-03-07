# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

PN="SynologyDriveClient"
DESCRIPTION="Synology Drive"
HOMEPAGE="http://www.synology.com/"
SRC_URI="amd64? ( http://global.download.synology.com/download/Tools/${PN}/1.0.3-${PV}/Ubuntu/Installer/x86_64/synology-drive-${PV}.x86_64.deb )
	x86? ( http://global.download.synology.com/download/Tools/${PN}/1.0.3-${PV}/Ubuntu/Installer/i686/synology-drive-${PV}.i686.deb )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror strip"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
	cp -a opt usr "${D}" || die
}
