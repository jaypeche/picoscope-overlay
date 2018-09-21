# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: http://ftp.pingwho.org/pub/gentoo/ftp/overlay/picoscope-overlay/dev-libs/picoipp/picoipp-1.3.0.4.21.ebuild revision 1 09/21/2018 jay Exp $

EAPI=5

inherit rpm

DESCRIPTION="Intel Integrated Performance Primitives exports for Pico Technology Products."
HOMEPAGE="http://www.picotech.com/picoscope-oscilloscope-software.html"

MY_V=(${PV//./ })
MY_PV=${MY_V[0]}"."${MY_V[1]}"."${MY_V[2]}"-"${MY_V[3]}"r"${MY_V[4]}

SRC_URI="amd64? ( http://labs.picotech.com/rpm/x86_64/libpicoipp-${MY_PV}.x86_64.rpm \
	http://ftp.pingwho.org/pub/gentoo/ftp/distfiles/rpms/libpicoipp-${MY_PV}.x86_64.rpm )"
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
	insinto "/etc/ld.so.conf.d"
	doins etc/ld.so.conf.d/picoscope.conf
}
