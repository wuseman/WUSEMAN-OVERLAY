# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker

PN="SynologyCloudSyncDecryptionTool"
DESCRIPTION="A desktop tool to decrypt data encrypted by Cloud Sync."
HOMEPAGE="http://www.synology.com/"
SRC_URI="amd64? ( http://global.download.synology.com/download/Tools/${PN}/${PV}/Linux/x86_64/${PN}-${PV}_x64.tar.gz )
           x86? ( http://global.download.synology.com/download/Tools/${PN}/${PV}/Linux/i686/${PN}-${PV}.tar.gz )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror strip"
IUSE="xcb linuxfb minimal offscreen"

RDEPEND="dev-qt/qtgui media-gfx/asymptote"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_unpack() {
    if [ "${A}" != "" ]; then
    unpack ${A}
    fi
}

src_install() {
    echo $WORKDIR
    ls $WORKDIR
    echo "S=$S"
    echo "PV=$PV"
    echo "PVR=$PVR"
    insinto /opt/Synology/SynologyCloudSyncDecryptionTool
#    doins -r /usr/bin/local/
    doins -r ${WORKDIR}/SynologyCloudSyncDecryptionTool 
    dobin SynologyCloudSyncDecryptionTool
    elog ""
    elog "GUI is now supported for this tool."
    elog "To run this application in GUI."
    elog "Please start the decryption tool from /opt/Synology/SynologyCloudSyncDecryptionTool"
    elog "chmod +x /opt/Synology/SynologyCloudSyncDecryptionTool/SynologyCloudSyncDecryptionTool"
    elog "cd /opt/Synology/SynologyCloudSyncDecryptionTool/; ./SynologyCloudSyncDecryptionTool"
    elog ""
    elog "This is only temporary solution for the GUI environment, will be fixed soon."
    elog ""
}
