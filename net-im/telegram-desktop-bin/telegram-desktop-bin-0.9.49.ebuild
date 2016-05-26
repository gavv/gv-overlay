# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils gnome2-utils fdo-mime

DESCRIPTION="Official desktop client for Telegram. Binary package"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="(
	https://github.com/telegramdesktop/tdesktop/archive/v${PV}.tar.gz -> tdesktop-${PV}.tar.gz
	amd64? ( https://updates.tdesktop.com/tlinux/tsetup.${PV}.tar.xz )
	x86? ( https://updates.tdesktop.com/tlinux32/tsetup32.${PV}.tar.xz )
)"

LICENSE="GPL-3" # FIXME
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	!net-im/telegram-desktop
	dev-libs/glib:2
	dev-libs/gobject-introspection
	x11-libs/libX11
	>=x11-libs/libxcb-1.10[xkb]
	>=sys-apps/dbus-1.4.20
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/Telegram"

src_install() {
	newbin "${WORKDIR}/Telegram/Telegram" telegram-desktop

	insopts -m644
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" \
				"${WORKDIR}/tdesktop-${PV}/Telegram/Resources/art/icon${icon_size}.png" \
				telegram-desktop.png
	done

	insinto /usr/share/applications
	doins "${WORKDIR}/tdesktop-${PV}"/lib/xdg/telegramdesktop.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
