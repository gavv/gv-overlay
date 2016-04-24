# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit elisp

DESCRIPTION="Some enhanced functions for buffer manipulate"
HOMEPAGE="http://www.emacswiki.org/emacs/buffer-extension.el"
# taken from https://www.emacswiki.org/emacs/download/buffer-extension.el
SRC_URI="https://enise.org/users/victor/share/distfiles/${P}.el.xz"
DEPEND="app-emacs/basic-toolkit"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
