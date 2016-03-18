# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/roysc/cpp11-mode.git"

inherit elisp git-2

DESCRIPTION="Emacs major-mode for C++11"
HOMEPAGE="https://github.com/roysc/cpp11-mode"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
