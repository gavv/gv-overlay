# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit elisp

DESCRIPTION="An Emacs front-end for ack"
HOMEPAGE="http://nschum.de/src/emacs/full-ack/"
SRC_URI="https://github.com/nschum/full-ack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv2+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/full-ack-${PV}"
SITEFILE="50${PN}-gentoo.el"
#DOCS="README.md"
