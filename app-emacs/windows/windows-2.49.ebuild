# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Window manager for GNU Emacs"
HOMEPAGE="http://www.gentei.org/~yuuji/software/"
SRC_URI=""
DEPEND="app-emacs/revive"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	mkdir -p "${S}"
	cp "${FILESDIR}/${PV}/${PN}.el" "${S}"
}
