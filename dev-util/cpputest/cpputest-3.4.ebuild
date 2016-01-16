# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="CppUTest unit testing and mocking framework for C/C++"
HOMEPAGE="http://cpputest.github.io"
SRC_URI="https://raw.githubusercontent.com/cpputest/cpputest.github.io/master/releases/${P}.tar.gz"
IUSE="-memory-leak-detection"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable memory-leak-detection memory-leak-detection)
}
