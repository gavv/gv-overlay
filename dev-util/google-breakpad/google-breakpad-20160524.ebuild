# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

_sha="79901bb99d5f5bdfc8ed7e422250a9d008b941a1"

inherit eutils

DESCRIPTION="Client and server components which implement a crash-reporting system"
HOMEPAGE="https://chromium.googlesource.com/breakpad/breakpad"
SRC_URI="https://chromium.googlesource.com/breakpad/breakpad/+archive/${_sha}.tar.gz -> google-breakpad-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	virtual/awk
	dev-util/linux-syscall-support
"
RDEPEND=""

src_unpack() {
	mkdir "${S}"
	cd "${S}"
	unpack "google-breakpad-${PV}.tar.gz"
}

src_prepare() {
	default
	ln -s /usr/include/linux_syscall_support ./src/third_party/lss
}
