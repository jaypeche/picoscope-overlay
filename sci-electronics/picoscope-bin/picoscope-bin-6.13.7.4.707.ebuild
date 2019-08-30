# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: http://ftp.pingwho.org/pub/gentoo/ftp/overlay/picoscope-overlay/sci-electronics/picoscope-bin/picoscope-bin-6.13.7.4.707.ebuild revision 1 09/17/2018 jay Exp $

EAPI=5

inherit rpm user udev xdg-utils

DESCRIPTION="PicoScope is the standard in PC Oscilloscope software"
HOMEPAGE="http://www.picotech.com/picoscope-oscilloscope-software.html"

MY_V=(${PV//./ })
MY_PV=${MY_V[0]}"."${MY_V[1]}"."${MY_V[2]}"-"${MY_V[3]}"r"${MY_V[4]}

SRC_URI="https://labs.picotech.com/rpm/noarch/picoscope-${MY_PV}.noarch.rpm \
         https://ftp.pingwho.org/pub/gentoo/ftp/distfiles/rpms/picoscope-${MY_PV}.noarch.rpm"
RESTRICT="mirror"

LICENSE="PICO"
SLOT="0"
KEYWORDS="~amd64"

IUSE_SCOPE_DEVICES="
        scope_pl1000
        scope_ps2000
        scope_ps2000a
        scope_ps3000
        scope_ps3000a
        scope_ps4000
        scope_ps4000a
        scope_ps5000
        scope_ps5000a
        scope_ps6000"

IUSE="${IUSE_SCOPE_DEVICES}"

DEPEND="${RDEPEND}"
RDEPEND="
	>=dev-lang/mono-4.8.0.524
	>=dev-dotnet/gtk-sharp-2.12.21
	>=dev-libs/libusb-1.0.21
	=dev-libs/picoipp-1.3.0.4.21
	=dev-libs/usbdrdaq-2.0.0.1.570
	=dev-libs/plcm3-2.0.17.1.1441
	=dev-libs/usbpt104-2.0.17.1.1441"

PDEPEND="
	scope_pl1000?	( =dev-libs/pl1000-2.0.0.1.570 )
	scope_ps2000?	( =dev-libs/ps2000-3.0.0.3.570 )
	scope_ps2000a?	( =dev-libs/ps2000a-2.1.0.5.570 )
	scope_ps3000?	( =dev-libs/ps3000-4.0.0.3.570 )
	scope_ps3000a?	( =dev-libs/ps3000a-2.1.0.6.570 )
	scope_ps4000?	( =dev-libs/ps4000-2.1.0.2.570 )
	scope_ps4000a?	( =dev-libs/ps4000a-2.1.0.2.570 )
	scope_ps5000?	( =dev-libs/ps5000-2.1.0.3.570 )
	scope_ps5000a?	( =dev-libs/ps5000a-2.1.0.5.570 )
	scope_ps6000?	( =dev-libs/ps6000-2.1.0.6.580 )"

S="${WORKDIR}/"

pkg_setup()
{
	ebegin "Creating named group"
	enewgroup pico
}

src_unpack()
{
    rpm_src_unpack ${A}
}

src_install()
{
	insinto "/opt"
	doins -r opt/*
	fperms 755 "/opt/picoscope/bin/picoscope"
	udev_dorules "${FILESDIR}/95-pico.rules"
	domenu "${FILESDIR}/picoscope.desktop"
}

pkg_postinst() {
	einfo
	xdg_desktop_database_update || die "Update .desktop database failed !"
	einfo
	elog "Please note that you will have to install the corresponding driver"
	elog "for your device. Consult dev-libs/psXXXX packages corresponding"
	elog "to your device. You may get some help determining which driver to"
	elog "pull in at: http://www.picotech.com/linux.html"
	elog "Note that you have to be either root or member of the group pico to"
	elog "be able to use picoscope devices. You can add a user to the pico group"
	elog "using usermod -a -G pico <username>"
}
