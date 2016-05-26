# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Linux Syscall Support -- a header file that can be included to make direct system calls"
HOMEPAGE="https://chromium.googlesource.com/linux-syscall-support/"
# from https://chromium.googlesource.com/linux-syscall-support/+archive/348bdf8d32b37c8fb2627df7a0a977d1d640e1fc.tar.gz
SRC_URI="https://enise.org/users/victor/share/distfiles/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "${P}.tar.gz"
}

src_install() {
	insinto /usr/include/lss
	doins linux_syscall_support.h
}
