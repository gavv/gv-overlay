# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Select buffer by cycling through"
HOMEPAGE="http://www.emacswiki.org/emacs/cycle-buffer.el"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	mkdir -p "${S}"
	cp "${FILESDIR}/${PV}/${PN}.el" "${S}"
}
