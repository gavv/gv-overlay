# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Google Breakpad -- client and server components of a crash-reporting system"
HOMEPAGE="https://chromium.googlesource.com/breakpad/breakpad"
# from https://chromium.googlesource.com/breakpad/breakpad/+archive/79901bb99d5f5bdfc8ed7e422250a9d008b941a1.tar.gz
SRC_URI="https://enise.org/users/victor/share/distfiles/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/awk
	dev-libs/lss
"
RDEPEND=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${P}.tar.gz"
}

src_prepare() {
	default
	ln -s /usr/include/lss ./src/third_party/lss
}
