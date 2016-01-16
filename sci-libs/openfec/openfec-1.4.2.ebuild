# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils cmake-utils versionator

MY_PV=$(replace_all_version_separators '_')

DESCRIPTION="Application-Level Forward Erasure Correction codes"
HOMEPAGE="http://openfec.org"
SRC_URI="http://openfec.org/files/openfec_v${MY_PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="-debug"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}_v${PV}"

src_configure() {
	if use debug; then
		mycmakeargs="-DDEBUG:STRING=ON"
		CMAKE_BUILD_TYPE="Debug"
	else
		mycmakeargs="-DDEBUG:STRING=OFF"
		CMAKE_BUILD_TYPE="Release"
	fi

	cmake-utils_src_configure
}

src_install() {
	if use debug; then
		myout="bin/Debug"
	else
		myout="bin/Release"
	fi

	dodoc README CHANGELOG

	dolib "${myout}"/libopenfec.so
	dolib "${myout}"/libopenfec.so.1
	dolib "${myout}"/libopenfec.so."${PV}"

	find src -type f -name '*.h' | while read f; do
		insinto /usr/include/openfec/"$(dirname "${f}" | sed -re 's:^src/::')"
		doins "${f}"
	done
}
