# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils autotools

MY_PV="${PV/_p*/}"
MY_PATCHLEVEL="${PV/*_p/}"

S="${WORKDIR}/${PN}-${MY_PV}.orig"

DESCRIPTION="A curses URL parser for text files"
SLOT="0"
HOMEPAGE="https://packages.qa.debian.org/u/urlview.html"
SRC_URI="http://ftp.debian.org/debian/pool/main/u/urlview/${PN}_${MY_PV}.orig.tar.gz
http://ftp.debian.org/debian/pool/main/u/urlview/${PN}_${MY_PV}-${MY_PATCHLEVEL}.diff.gz"

LICENSE="GPL-2+"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sys-libs/ncurses:0"
DEPEND="${RDEPEND}"

src_prepare() {
	mv configure.in configure.ac || die \
				"Renaming configure.in to configure.ac failed"
	eapply "${WORKDIR}/${PN}_${MY_PV}-${MY_PATCHLEVEL}.diff"
	eapply_user
	eautoconf
	eautomake
}

src_configure() {
	LIBS="-ltinfo" econf
}

src_install() {
	dodir "/usr/share/man/man1"
	emake DESTDIR="${D}" mandir="${D}/usr/share/man/" install
}
