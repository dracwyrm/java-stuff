# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java library for creating and editing PDF files"
HOMEPAGE="https://github.com/LibrePDF/OpenPDF"
SRC_URI="https://github.com/LibrePDF/OpenPDF/archive/${PV}.tar.gz -> openpdf-${PV}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"

IUSE="test"

KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

CP_DEPEND=">=dev-java/bcprov-1.56:1
	   >=dev-java/bcpkix-1.56:1"

DEPEND=">=virtual/jdk-1.7
	test? ( dev-java/junit:4
		dev-java/assertj-core:2 )
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

src_test() {
	local DIR="src/test/java"
	local CP="${DIR}/../resources:${DIR}:${PN}.jar:$(java-pkg_getjars junit-4,assertj-core-2)"

	local TESTS=$(find "${DIR}" -name "*Test.java")
	TESTS="${TESTS//src\/test\/java\/}"
	TESTS="${TESTS//.java}"
	TESTS="${TESTS//\//.}"

	ejavac -cp "${CP}" -d "${DIR}" $(find "${DIR}" -name "*.java")
	ejunit4 -classpath "${CP}" ${TESTS}
}
