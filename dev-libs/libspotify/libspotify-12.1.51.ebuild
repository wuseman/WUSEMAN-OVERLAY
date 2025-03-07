# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib

DESCRIPTION="C API package to utilize the Spotify music streaming service"
HOMEPAGE="https://developer.spotify.com/technologies/libspotify/"
SRC_URI="https://github.com/mopidy/libspotify-archive/blob/master/libspotify-12.1.51-Linux-x86_64-release.tar.gz?raw=true -> ${P}.tar.gz"

LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

DEPEND="virtual/pkgconfig"

QA_PRESTRIPPED="/usr/$(get_libdir)/${PN}.so.${PV}"

S=${WORKDIR}/${P}-Linux-x86_64-release

src_prepare() {
	sed -i -e 's#PKG_PREFIX:$(prefix)#PKG_PREFIX:$(real_prefix)#'\
		-e 's/ldconfig.*//'\
		-e "s#prefix)/lib#prefix)/$(get_libdir)#g" Makefile || die
	sed -i -e "s#{exec_prefix}/lib#{exec_prefix}/$(get_libdir)#" lib/pkgconfig/${PN}.pc || die
}

src_compile() {
	:
}

src_install() {
	emake prefix="${D}usr" real_prefix="${ROOT}usr" install
	dodoc README ChangeLog

	# install man
	doman share/man3/*
}
