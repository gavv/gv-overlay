# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

DESCRIPTION="Ragel mmm-mode based highlighter"
HOMEPAGE="https://www.emacswiki.org/emacs/RagelMode"
SRC_URI="https://github.com/gavv/distfiles/raw/master/${P}.el.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
