# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

_rev="324"

inherit autotools eutils autotools python-r1 vala

DESCRIPTION="Library for instrumenting and integrating with all aspects of the Unity shell"
HOMEPAGE="https://launchpad.net/libunity"
# from http://bazaar.launchpad.net/~unity-team/libunity/trunk/tarball/${_rev}
SRC_URI="https://enise.org/users/victor/share/distfiles/libunity-${_rev}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-libs/dee-1.2.5:=[introspection]
	dev-libs/libdbusmenu:=
	dev-libs/libgee:0
	x11-libs/gtk+:3
	${PYTHON_DEPS}
	$(vala_depend)"
RDEPEND="${DEPEND}"

S="${WORKDIR}/~unity-team/libunity/trunk"

src_prepare() {
	default
	vala_src_prepare
	export VALA_API_GEN="$VAPIGEN"
	eautoreconf
}

src_configure() {
	python_copy_sources
	configuration() {
		econf || die
	}
	python_foreach_impl run_in_build_dir configuration
}

src_compile() {
	compilation() {
		emake || die
	}
	python_foreach_impl run_in_build_dir compilation
}

src_install() {
	installation() {
		emake DESTDIR="${D}" install
	}
	python_foreach_impl run_in_build_dir installation
	prune_libtool_files --modules
}
