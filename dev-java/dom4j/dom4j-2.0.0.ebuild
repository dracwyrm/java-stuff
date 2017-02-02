# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Open source framework for processing XML"
HOMEPAGE="http://dom4j.github.io/"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="dom4j"
SLOT="2"

KEYWORDS="~amd64 ~arm ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"

CP_DEPEND="dev-java/jaxen:1.1
	   dev-java/relaxng-datatype:0
	   dev-java/xpp2:0
	   dev-java/xpp3:0
	   dev-java/xsdlib:0"

RDEPEND="${CP_DEPEND}
	 >=virtual/jre-1.8"

DEPEND="${CP_DEPEND}
	>=virtual/jdk-1.8"

S="${WORKDIR}/${P}"

PATCHES=( "${FILESDIR}/${P}-xpp3-add-removeAttribute.patch" )
