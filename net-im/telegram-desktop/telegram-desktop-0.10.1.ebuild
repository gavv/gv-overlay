# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

_qtver=5.6.0
_qtver_short=5.6

inherit eutils gnome2-utils xdg

DESCRIPTION="Official desktop client for Telegram, a cloud-based messaging app"
HOMEPAGE="https://desktop.telegram.org"
SRC_URI="
	https://github.com/telegramdesktop/tdesktop/archive/v${PV}.tar.gz -> tdesktop-${PV}.tar.gz
	http://download.qt-project.org/official_releases/qt/${_qtver_short}/$_qtver/single/qt-everywhere-opensource-src-${_qtver}.tar.xz
"

LICENSE="telegram"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="kde4 -debug"

QTCORE_DEPEND="
	dev-libs/glib:2
	dev-libs/icu
	>=dev-libs/libpcre-8.38[pcre16]
	>=sys-libs/zlib-1.2.5
	virtual/libiconv
"

QTGUI_DEPEND="
	dev-libs/libinput
	media-libs/fontconfig
	>=media-libs/freetype-2.6.1:2
	>=media-libs/harfbuzz-1.0.6[icu]
	media-libs/libpng:0
	virtual/jpeg:0
	virtual/libudev
	x11-libs/libICE
	x11-libs/libSM
	>=x11-libs/libxcb-1.10[xkb]
	>=x11-libs/libxkbcommon-0.4.1[X]
	x11-libs/libX11
	>=x11-libs/libXi-1.7.4
	x11-libs/libXrender
	x11-libs/xcb-util-image
	x11-libs/xcb-util-keysyms
	x11-libs/xcb-util-renderutil
	x11-libs/xcb-util-wm
"

QTNETWORK_DEPEND="
	dev-libs/openssl:0
	net-libs/libproxy
"

QTDBUS_DEPEND="
	>=sys-apps/dbus-1.4.20
"

RDEPEND="
	!net-im/telegram-desktop-bin
	${QTCORE_DEPEND}
	${QTGUI_DEPEND}
	${QTNETWORK_DEPEND}
	${QTDBUS_DEPEND}
	dev-db/sqlite
	media-libs/libwebp
	>=media-libs/openal-1.17.2
	media-libs/opus
	sys-libs/zlib[minizip]
	>=media-video/ffmpeg-3.1.1[opus]
	x11-themes/hicolor-icon-theme
	x11-libs/libva
"

DEPEND="${RDEPEND}
	dev-libs/libappindicator:2
"

QSTATIC="${WORKDIR}"/Libraries/QtStatic

S="${WORKDIR}/tdesktop-${PV}"

src_unpack() {
	unpack "qt-everywhere-opensource-src-${_qtver}.tar.xz"
	mkdir -p "${WORKDIR}"/Libraries || die
	mv "qt-everywhere-opensource-src-${_qtver}" "${QSTATIC}" || die

	cd "${WORKDIR}" || die
	unpack "tdesktop-${PV}.tar.gz"

	cd "${S}" || die
}

src_prepare() {
	default

	cd "${QSTATIC}/qtbase" || die
	epatch "${S}/Telegram/Patches/qtbase_${_qtver//./_}.diff"

	cd "${S}" || die
	epatch "${FILESDIR}/${P}-qmake.patch"

	xdg_src_prepare
}

src_configure() {
	einfo "Configuring Qt ${_qtver}"
	cd "${QSTATIC}" || die
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
			-no-gtkstyle \
			-static \
			-nomake examples \
			-nomake tests || die
}

src_compile() {
	if use debug; then
		variant="debug"
		output="Debug"
	else
		variant="release"
		output="Release"
	fi

	einfo "Building Qt ${_qtver}"
	cd "${QSTATIC}" || die
	emake module-qtbase module-qtimageformats
	emake module-qtbase-install_subtargets module-qtimageformats-install_subtargets
	export PATH="${WORKDIR}/qt/bin:$PATH"

	einfo "Building codegen_style"
	mkdir -p "${S}/Linux/obj/codegen_style/${output}" || die
	cd "${S}/Linux/obj/codegen_style/${output}"
	qmake CONFIG+="${variant}" \
		../../../../Telegram/build/qmake/codegen_style/codegen_style.pro \
		|| die
	emake

	einfo "Building codegen_numbers"
	mkdir -p "${S}/Linux/obj/codegen_numbers/${output}" || die
	cd "${S}/Linux/obj/codegen_numbers/${output}" || die
	qmake CONFIG+="${variant}" \
		../../../../Telegram/build/qmake/codegen_numbers/codegen_numbers.pro \
		|| die
	emake

	einfo "Building MetaLang"
	mkdir -p "${S}/Linux/${output}IntermediateLang" || die
	cd "${S}/Linux/${output}IntermediateLang" || die
	qmake CONFIG+="${variant}" ../../Telegram/MetaLang.pro \
		|| die
	emake

	einfo "Generating code"
	"../codegen/${output}/codegen_style" \
		"-I./../../Telegram/Resources" \
		"-I./../../Telegram/SourceFiles" \
		"-o./../../Telegram/GeneratedFiles/styles" \
		all_files.style --rebuild \
		|| die
	"../codegen/${output}/codegen_numbers" \
		"-o./../../Telegram/GeneratedFiles" \
		"./../../Telegram/Resources/numbers.txt" \
		|| die
	"../${output}Lang/MetaLang" \
		-lang_in ./../../Telegram/Resources/langs/lang.strings \
		-lang_out ./../../Telegram/GeneratedFiles/lang_auto \
		|| die

	einfo "Building Telegram Desktop"
	mkdir -p "${S}/Linux/${output}" || die
	cd "${S}/Linux/${output}" || die
	qmake \
		QT_TDESKTOP_PATH="../../../qt" \
		QT_TDESKTOP_VERSION="${_qtver}" \
		CONFIG+="${variant}" \
		DEFINES+=TDESKTOP_DISABLE_AUTOUPDATE \
		DEFINES+=TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME \
		DEFINES+=TDESKTOP_DISABLE_CRASH_REPORTS \
		DEFINES+=TDESKTOP_DISABLE_UNITY_INTEGRATION \
		../../Telegram/Telegram.pro || die
	emake
}

src_install() {
	local output
	if use debug; then
		output="Debug"
	else
		output="Release"
	fi

	newbin "${S}/Linux/${output}/Telegram" telegram-desktop

	local icon_size
	for icon_size in 16 32 48 64 128 256 512; do
		newicon -s "${icon_size}" "${S}/Telegram/Resources/art/icon${icon_size}.png" \
			telegram-desktop.png
	done

	newmenu "${WORKDIR}/tdesktop-${PV}"/lib/xdg/telegramdesktop.desktop telegram-desktop.desktop

	if use kde4; then
		insinto /usr/share/kde4/services
		doins "${S}"/lib/xdg/tg.protocol
	fi
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_icon_cache_update
}
