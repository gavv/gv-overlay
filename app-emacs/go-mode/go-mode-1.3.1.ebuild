# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit elisp git-r3

DESCRIPTION="An improved Go mode for emacs"
HOMEPAGE="https://github.com/dominikh/go-mode.el"
SRC_URI=""

EGIT_REPO_URI="https://github.com/dominikh/go-mode.el.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"
