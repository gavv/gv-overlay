# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

_qtver=5.6.0
_qtver_short=5.6

inherit eutils gnome2-utils fdo-mime

DESCRIPTION="Desktop client of Telegram, the messaging app"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="(
	https://github.com/telegramdesktop/tdesktop/archive/v${PV}.tar.gz -> tdesktop-${PV}.tar.gz
	http://download.qt-project.org/official_releases/qt/${_qtver_short}/$_qtver/single/qt-everywhere-opensource-src-${_qtver}.tar.xz
)"

LICENSE="GPL-3" # FIXME
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtkstyle -debug"

RDEPEND="
	dev-libs/glib:2
	>=dev-libs/libpcre-8.38
	>=sys-libs/zlib-1.2.5
	virtual/libiconv
	dev-libs/icu

	media-libs/fontconfig
	>=media-libs/freetype-2.6.1:2
	>=media-libs/harfbuzz-1.0.6[icu]
	gtkstyle? (
		x11-libs/gtk+:2
		x11-libs/pango
	)
	virtual/jpeg:0
	dev-libs/libinput
	x11-libs/libxkbcommon
	media-libs/libpng:0
	virtual/libudev
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	>=x11-libs/libXi-1.7.4
	x11-libs/libXrender
	>=x11-libs/libxcb-1.10[xkb]
	>=x11-libs/libxkbcommon-0.4.1[X]
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm

	dev-libs/openssl:0
	net-libs/libproxy
	>=sys-apps/dbus-1.4.20

	sys-libs/zlib[minizip]
	dev-db/sqlite
	x11-libs/libva
	>=media-libs/openal-1.17.2
	virtual/ffmpeg[opus]
	media-libs/opus
	media-libs/libwebp
	dev-util/google-breakpad
	x11-themes/hicolor-icon-theme
"
DEPEND="${RDEPEND}
	dev-libs/libunity
	dev-libs/libappindicator:3
	media-libs/libexif
"

QSTATIC="${WORKDIR}"/Libraries/QtStatic

S="${WORKDIR}/tdesktop-${PV}"

src_unpack() {
	unpack "qt-everywhere-opensource-src-${_qtver}.tar.xz"
	mkdir -p "${WORKDIR}"/Libraries
	mv "qt-everywhere-opensource-src-${_qtver}" "${QSTATIC}"

	cd "${WORKDIR}"
	unpack "tdesktop-${PV}.tar.gz"

	cd "${S}"
}

src_prepare() {
	default

	cd "${QSTATIC}/qtbase"
	epatch "${S}/Telegram/Patches/qtbase_${_qtver//./_}.diff"

	cd "${S}"
	epatch "${FILESDIR}/${P}-qmake.patch"
}

src_configure() {
	einfo "Configuring Qt ${_qtver}"
	cd "${QSTATIC}"
	opts=""
	if use gtkstyle; then
		opts="${opts} -gtkstyle"
	else
		opts="${opts} -no-gtkstyle"
	fi
	./configure -prefix "${WORKDIR}/qt" \
			-release \
			-opensource \
			-confirm-license \
			-system-sqlite \
			-system-zlib \
			-system-libpng \
			-system-libjpeg \
			-system-freetype \
			-system-harfbuzz \
			-system-pcre \
			-system-xcb \
			-system-xkbcommon-x11 \
			-system-pcre \
			-no-opengl \
			-no-pulseaudio \
			-no-alsa \
			-no-cups \
			-no-evdev \
			-no-tslib \
			-no-eglfs \
			-no-kms \
			-no-gbm \
			-no-directfb \
			-no-linuxfb \
			-no-gstreamer \
			-no-slog2 \
			-no-pps \
			-no-imf \
			-no-lgmon \
			-no-mtdev \
			-no-journald \
			-no-nis \
			${opts} \
			-static \
			-nomake examples \
			-nomake tests || die
}

src_compile() {
	einfo "Building Qt ${_qtver}"
	cd "${QSTATIC}"
	emake module-qtbase module-qtimageformats
	emake module-qtbase-install_subtargets module-qtimageformats-install_subtargets
	export PATH="${WORKDIR}/qt/bin:$PATH"

	einfo "Building codegen_style"
	mkdir -p "${S}"/Linux/obj/codegen_style/Debug
	cd "${S}"/Linux/obj/codegen_style/Debug
	qmake CONFIG+=debug ../../../../Telegram/build/qmake/codegen_style/codegen_style.pro \
		|| die
	emake

	einfo "Building codegen_numbers"
	mkdir -p "${S}"/Linux/obj/codegen_numbers/Debug
	cd "${S}"/Linux/obj/codegen_numbers/Debug
	qmake CONFIG+=debug \
		../../../../Telegram/build/qmake/codegen_numbers/codegen_numbers.pro \
		|| die
	emake

	einfo "Building MetaLang"
	mkdir -p "${S}"/Linux/DebugIntermediateLang
	cd "${S}"/Linux/DebugIntermediateLang
	qmake CONFIG+=debug ../../Telegram/MetaLang.pro \
		|| die
	emake

	einfo "Generating code"
	../codegen/Debug/codegen_style \
		"-I./../../Telegram/Resources" \
		"-I./../../Telegram/SourceFiles" \
		"-o./../../Telegram/GeneratedFiles/styles" \
		all_files.style --rebuild \
		|| die
	../codegen/Debug/codegen_numbers \
		"-o./../../Telegram/GeneratedFiles" \
		"./../../Telegram/Resources/numbers.txt" \
		|| die
	../DebugLang/MetaLang \
		-lang_in ./../../Telegram/Resources/langs/lang.strings \
		-lang_out ./../../Telegram/GeneratedFiles/lang_auto \
		|| die

	einfo "Building Telegram Desktop"
	variant="release"
	output="ReleaseIntermediate"
	if use debug; then
		variant="debug"
		output="DebugIntermediate"
	fi
	mkdir -p "${S}/Linux/${output}"
	cd "${S}/Linux/${output}"
	qmake \
		CONFIG+="${variant}" \
		DEFINES+=TDESKTOP_DISABLE_AUTOUPDATE \
		DEFINES+=TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME \
		../../Telegram/Telegram.pro || die
	emake
}

src_install() {
	output="Release"
	if use debug; then
		output="Debug"
	fi
	newbin "${S}/Linux/${output}/Telegram" telegram-desktop

	insopts -m644
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" "${S}/Telegram/Resources/art/icon${icon_size}.png" \
			telegram-desktop.png
	done

	insinto /usr/share/applications
	doins "${S}"/lib/xdg/telegramdesktop.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
