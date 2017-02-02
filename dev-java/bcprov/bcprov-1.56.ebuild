# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple versionator

MY_PV="r$(get_version_component_range 1)rv$(get_version_component_range 2)"
MY_P="bc-java-${MY_PV}"

DESCRIPTION="Java cryptography APIs"
HOMEPAGE="http://www.bouncycastle.org/java.html"
#SRC_URI="http://central.maven.org/maven2/org/bouncycastle/${MY_PN}/${PV}/${MY_P}.jar"
SRC_URI="https://github.com/bcgit/bc-java/archive/${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"

IUSE="test"

KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos"

DEPEND=">=virtual/jdk-1.7
	test? ( dev-java/junit:4 )
	${CP_DEPEND}"

RDEPEND=">=virtual/jre-1.7
	 ${CP_DEPEND}"

S="${WORKDIR}/bc-java-r1rv56/prov"

JAVA_ENCODING="ISO-8859-1"
JAVA_SRC_DIR="src/main/java"
JAVADOC_ARGS="-breakiterator"

src_prepare() {
	java-pkg-2_src_prepare

	# Copy needed files
	cp -anl "${WORKDIR}/bc-java-r1rv56/core/src/main/"* src/main/ || die
}

src_compile() {
	java-pkg-simple_src_compile
	java-pkg_addres ${PN}.jar src/main/resources
}

src_test() {
	local DIR="src/test/java"
	local CP="${DIR}/../resources:${DIR}:${PN}.jar:$(java-pkg_getjars junit-4)"

	local TESTS=$(find "${DIR}" -name "*Test.java")
	TESTS="${TESTS//src\/test\/java\/}"
	TESTS="${TESTS//.java}"
	TESTS="${TESTS//\//.}"

	ejavac -cp "${CP}" -d "${DIR}" $(find "${DIR}" -name "*.java")
	ejunit4 -classpath "${CP}" ${TESTS}
}
