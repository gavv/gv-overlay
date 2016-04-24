# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

DESCRIPTION="Basic edit toolkit"
HOMEPAGE="http://www.emacswiki.org/emacs/basic-toolkit.el"
# taken from https://www.emacswiki.org/emacs/download/basic-toolkit.el
SRC_URI="https://enise.org/users/victor/share/distfiles/${P}.el.xz"
DEPEND="app-emacs/windows app-emacs/cycle-buffer"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
