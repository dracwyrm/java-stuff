# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/LibrePDF/OpenPDF/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux"

CP_DEPEND=">=dev-java/bcprov-1.56:0
	 >=dev-java/bcpkix-1.56:0"

DEPEND=">=virtual/jdk-1.7
	app-arch/unzip
	${CP_DEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CP_DEPEND}"

S="${WORKDIR}/OpenPDF-${PV}/openpdf"

PATCHES=( "${FILESDIR}"/${P}-PDFGraphics2D-constructors.patch )

JAVA_ENCODING="ISO-8859-1"
JAVA_SRC_DIR="src/main/java"

src_prepare() {
	default
	java-utils-2_src_prepare
}

src_compile() {
	java-pkg-simple_src_compile
	java-pkg_addres ${PN}.jar src/main/resources
}
