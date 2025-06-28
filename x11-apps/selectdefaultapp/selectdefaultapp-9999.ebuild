# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 qmake-utils

DESCRIPTION="Define default applications on Linux in a sane way"
HOMEPAGE="https://github.com/magnus-ISU/selectdefaultapplication"
EGIT_REPO_URI="https://github.com/magnus-ISU/selectdefaultapplication"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="x11-themes/hicolor-icon-theme"

src_compile() {
	eqmake5 || die "eqmake5 failed"
	emake || die "emake failed"
}

src_install() {
	default
	dobin selectdefaultapplication

	insinto /usr/share/applications
	doins selectdefaultapplication.desktop

	insinto /usr/share/icons/hicolor/48x48/apps
	doins selectdefaultapplication.png
}
