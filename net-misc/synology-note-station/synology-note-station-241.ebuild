# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib unpacker eutils
DESCRIPTION="Note Station let you manage all the notes/to-do list offline, right from your local computer."
HOMEPAGE="https://www.synology.com/"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/NoteStationClient/2.1.2-${PV}/Ubuntu"
SRC_URI="amd64? ( ${SRC_URI_BASE}/x86_64/synology-note-station-2.1.2-${PV}-linux-x64.deb -> synology-note-station-2.1.2-${PV}-linux-x64.deb )
           x86? ( ${SRC_URI_BASE}/i686/synology-note-station-2.1.2-${PV}-linux-x86.deb -> synology-note-station-2.1.2-${PV}-linux-x86.deb )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/icu"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
RESTRICT="strip"

S="${WORKDIR}"

src_install() {
cp -a opt usr "${D}" || die
}
