# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Some enhanced functions for buffer manipulate"
HOMEPAGE="http://www.emacswiki.org/emacs/buffer-extension.el"
SRC_URI=""
DEPEND="app-emacs/basic-toolkit"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	mkdir -p "${S}"
	cp "${FILESDIR}/${PV}/${PN}.el" "${S}"
}
