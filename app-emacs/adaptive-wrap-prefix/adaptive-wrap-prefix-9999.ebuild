# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/emacsmirror/adaptive-wrap-prefix.git"
EGIT_BRANCH="elpa"

inherit elisp git-2

DESCRIPTION="Perform smart line-wrapping with wrap-prefix"
HOMEPAGE="http://elpa.gnu.org/packages/adaptive-wrap.html"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
