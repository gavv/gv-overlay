# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils git-2

DESCRIPTION="An IM client for the Matrix protocol"
HOMEPAGE="https://github.com/Fxrh/Quaternion"

EGIT_REPO_URI="https://github.com/Fxrh/Quaternion.git"
SRC_URI=""

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtnetwork:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtdeclarative:5
	kde-frameworks/kcoreaddons:5
"
DEPEND="${RDEPEND}"

src_install() {
	cd "${BUILD_DIR}"
	dobin quaternion
}
