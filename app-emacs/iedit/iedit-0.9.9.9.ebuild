# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp

DESCRIPTION="Edit multiple regions simultaneously in a buffer or a region"
HOMEPAGE="https://github.com/victorhge/iedit "
SRC_URI="https://github.com/victorhge/iedit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/iedit-${PV}"
SITEFILE="50${PN}-gentoo.el"
DOCS="README.org"

src_compile() {
    elisp-compile *.el
    elisp-make-autoload-file
}
