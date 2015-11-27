# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/capitaomorte/autopair.git"

inherit elisp git-2

DESCRIPTION="Automagically pair braces and quotes in emacs like TextMate"
HOMEPAGE="https://github.com/capitaomorte/autopair"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
