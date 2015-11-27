# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp

DESCRIPTION="Basic edit toolkit"
HOMEPAGE="http://www.emacswiki.org/emacs/basic-toolkit.el"
SRC_URI=""
DEPEND="app-emacs/windows app-emacs/cycle-buffer"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

src_unpack() {
	mkdir -p "${S}"
	cp "${FILESDIR}/${PV}/${PN}.el" "${S}"
}
