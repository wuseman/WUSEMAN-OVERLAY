# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib unpacker eutils
DESCRIPTION="Cloud Station Backup is a backup service for Synology NAS."
HOMEPAGE="https://www.synology.com/"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/CloudStationBackup/4.2.7-${PV}/Ubuntu/Installer"
SRC_URI="amd64? ( ${SRC_URI_BASE}/x86_64/synology-cloud-station-backup-${PV}.x86_64.deb -> synology-cloud-station-backup-${PV}.x86_64.deb )
           x86? ( ${SRC_URI_BASE}/i686/synology-cloud-station-backup-${PV}.i686.deb -> synology-cloud-station-backup-${PV}.i686.deb )"

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
