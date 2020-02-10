# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
EGIT_REPO_URI="https://github.com/gavv/editing-helpers.el.git"

inherit elisp git-r3

DESCRIPTION="Editing helper functions for Emacs."
HOMEPAGE="https://github.com/gavv/editing-helpers.el"
SRC_URI=""

DEPEND="app-emacs/expand-region"
RDEPEND="${DEPEND}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
