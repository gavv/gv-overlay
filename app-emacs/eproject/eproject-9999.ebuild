# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/jrockway/eproject.git"

inherit elisp git-2

DESCRIPTION="File grouping extension for emacs"
HOMEPAGE="https://github.com/jrockway/eproject"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
