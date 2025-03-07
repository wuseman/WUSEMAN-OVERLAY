# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{8,9,10} )
inherit distutils-r1

DESCRIPTION="pure Python Off-The-Record encryption"
HOMEPAGE="https://pypi.org/project/python-potr/"
SRC_URI=""https://files.pythonhosted.org/packages/8e/58/bcbd8f223512d733992fcc0793170ffe20af2cd8da50e73c6f14e66d4e16/${P}.tar.gz

LICENSE="LGPLv3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
dev-python/pycrypto
"
RDEPEND="${DEPEND}"
