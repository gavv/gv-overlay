# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/emacsmirror/buffer-extension.git"

inherit elisp git-2

DESCRIPTION="Some enhanced functions for buffer manipulate"
HOMEPAGE="http://www.emacswiki.org/emacs/buffer-extension.el"
SRC_URI=""
DEPEND="app-emacs/basic-toolkit"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
