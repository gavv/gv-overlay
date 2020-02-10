# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
EGIT_REPO_URI="https://github.com/danamlund/emacs-no-easy-keys.git"

inherit elisp git-r3

DESCRIPTION="An Emacs mode to help you learn the proper Emacs movement keys"
HOMEPAGE="http://danamlund.dk/emacs/no-easy-keys.html"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
