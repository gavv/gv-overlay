# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=0

inherit git-2

DESCRIPTION="Runs Firefox and other apps in a sandbox, limiting their access to the filesystem"
HOMEPAGE="http://igurublog.wordpress.com/downloads/script-sandfox"

EGIT_REPO_URI="https://github.com/IgnorantGuru/sandfox.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-fs/inotify-tools"

src_install() {
	dobin sandfox
}
