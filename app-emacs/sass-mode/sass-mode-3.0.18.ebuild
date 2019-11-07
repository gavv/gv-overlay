# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Emacs mode for Sass"
HOMEPAGE="https://github.com/nex3/sass-mode"

EGIT_REPO_URI="https://github.com/nex3/sass-mode.git"
EGIT_COMMIT="${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=""
DEPEND="
	app-emacs/haml-mode
	${RDEPEND}
"
