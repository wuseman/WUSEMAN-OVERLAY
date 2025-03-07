# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker
MY_PN="SynologyAssistant"
MY_PV="${PV/_p/-}"

DESCRIPTION="Synology Assistant to setup DiskStations"
HOMEPAGE="http://www.synology.com/"
SRC_URI="amd64? ( http://global.download.synology.com/download/Tools/Assistant/${MY_PV}/Ubuntu/x86_64/${PN}_${PV/_p/-}_amd64.deb )
	x86? ( http://global.download.synology.com/download/Tools/Assistant/${MY_PV}/Ubuntu/i686/${PN}_${MY_PV}_i386.deb )"

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
