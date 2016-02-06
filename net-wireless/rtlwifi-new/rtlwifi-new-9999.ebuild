# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-2 linux-mod

DESCRIPTION="Newest Realtek rtlwifi codes (rtl8192, rtl8188, rtl8723, rtl8821)"
HOMEPAGE="https://github.com/lwfinger/rtlwifi_new"

SRC_URI=""
EGIT_REPO_URI="https://github.com/lwfinger/rtlwifi_new.git"

LICENSE="GPL-2 firmware? ( BSD )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+firmware"

RDEPEND=""
DEPEND="firmware? ( sys-kernel/linux-firmware )"

S="${WORKDIR}"
D="kernel/drivers/net/wireless/rtlwifi"

ARCH="x86_64"
MODULE_NAMES="
  rtlwifi(${D}:${S})
  rtl_usb(${D}:${S})
  rtl_pci(${D}:${S})
  btcoexist(${D}/btcoexist:${S}/btcoexist)
  rtl8821ae(${D}/rtl8821ae:${S}/rtl8821ae)
  rtl8723be(${D}/rtl8723be:${S}/rtl8723be)
  rtl8723ae(${D}/rtl8723ae:${S}/rtl8723ae)
  rtl8192se(${D}/rtl8192se:${S}/rtl8192se)
  rtl8192ee(${D}/rtl8192ee:${S}/rtl8192ee)
  rtl8192de(${D}/rtl8192de:${S}/rtl8192de)
  rtl8192cu(${D}/rtl8192cu:${S}/rtl8192cu)
  rtl8192c-common(${D}/rtl8192c:${S}/rtl8192c)
  rtl8192ce(${D}/rtl8192ce:${S}/rtl8192ce)
  rtl8188ee(${D}/rtl8188ee:${S}/rtl8188ee)"

src_compile() {
	emake
}

src_install() {
	linux-mod_src_install

	if use firmware; then
		insinto /lib/firmware/rtlwifi
		doins "${S}/firmware/rtlwifi/rtl8192defw_12.bin"
		doins "${S}/firmware/rtlwifi/rtl8192eefw_new.bin"
		doins "${S}/firmware/rtlwifi/rtl8192sefw.old.bin"
		doins "${S}/firmware/rtlwifi/rtl8812aefw.bin"
		doins "${S}/firmware/rtlwifi/rtl8812aefw_wowlan.bin"
	fi
}
