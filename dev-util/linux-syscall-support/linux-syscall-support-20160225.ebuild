# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

_sha="348bdf8d32b37c8fb2627df7a0a977d1d640e1fc"

inherit eutils

DESCRIPTION="A header file that can be included to make direct system calls"
HOMEPAGE="https://chromium.googlesource.com/linux-syscall-support/"
SRC_URI="https://chromium.googlesource.com/linux-syscall-support/+archive/${_sha}.tar.gz -> linux-syscall-support-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "linux-syscall-support-${PV}.tar.gz"
}

src_install() {
	insinto /usr/include/linux_syscall_support
	doins linux_syscall_support.h
}
