# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="Synology Chat allowing you to enjoy the instant messaging service on your PC"
HOMEPAGE="https://www.synology.com/de-de/dsm/cloud_services"
SRC_URI_BASE="https://global.download.synology.com/download/Tools/ChatClient/${PV}-40/Ubuntu"
SRC_URI="amd64? ( ${SRC_URI_BASE}/x86_64/Chat_${PV}-40_amd64.deb -> Chat_${PV}-40.deb )
x86? ( ${SRC_URI_BASE}/i686/Chat_${PV}-40_i386.deb -> Chat_${PV}-40.i386.deb )"
LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/icu"
RDEPEND="${DEPEND}"

QA_PREBUILT="*"
RESTRICT="strip"

S=${WORKDIR}


src_configure() {
                --docdir=${EPREFIX}/usr/share/doc/${PF} 
}

src_install() {
cp -a opt usr "${D}" 
sed -i 's/Categories=Application/Categories=Network;Internet/g' /var/tmp/portage/net-misc/synology-chat-1.0.1/image/usr/share/applications/synochat.desktop
}



