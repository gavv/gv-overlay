# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="Syntax highlighting for Slim"
HOMEPAGE="https://github.com/slim-template/emacs-slim"

EGIT_REPO_URI="https://github.com/slim-template/emacs-slim.git"
EGIT_COMMIT="${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND=""
DEPEND="
	app-emacs/haml-mode
	${RDEPEND}
"
