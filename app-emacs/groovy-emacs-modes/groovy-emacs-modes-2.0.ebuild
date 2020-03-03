# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

DESCRIPTION="A groovy major mode, grails minor mode, and a groovy inferior mode."
HOMEPAGE="https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes"
SRC_URI="https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
