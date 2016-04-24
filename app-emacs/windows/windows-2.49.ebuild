# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

DESCRIPTION="Window manager for GNU Emacs"
HOMEPAGE="http://www.gentei.org/~yuuji/software/"
# taken from http://www.gentei.org/~yuuji/software/euc/windows.el
SRC_URI="https://enise.org/users/victor/share/distfiles/${P}.el.xz"
DEPEND="app-emacs/revive"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
