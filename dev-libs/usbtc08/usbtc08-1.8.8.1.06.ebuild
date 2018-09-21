# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Revision 1 jay@arg.org Exp $

EAPI=5

inherit rpm

DESCRIPTION="Pico Technology USB TC-08 Linux driver"
HOMEPAGE="http://www.picotech.com/picoscope-oscilloscope-software.html"

MY_V=(${PV//./ })
MY_PV=${MY_V[0]}"."${MY_V[1]}"."${MY_V[2]}"-"${MY_V[3]}"r"${MY_V[4]}
SRC_URI="amd64? ( http://labs.picotech.com/rpm/x86_64/libusbtc08-${MY_PV}.x86_64.rpm http://ftp.pingwho.org/pub/gentoo/ftp/distfiles/rpms/libusbtc08-${MY_PV}.x86_64.rpm )"
RESTRICT="mirror"

LICENSE="PICO"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

S="${WORKDIR}/"

src_unpack()
{
    rpm_src_unpack ${A}
}

src_install()
{
	insinto "/opt"
	doins -r opt/*
}

