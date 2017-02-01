# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple

MY_PN="${PN}-jdk15on"
MY_P="${MY_PN}-${PV}-sources"

DESCRIPTION="Java cryptography APIs"
HOMEPAGE="http://www.bouncycastle.org/java.html"
SRC_URI="http://central.maven.org/maven2/org/bouncycastle/${MY_PN}/${PV}/${MY_P}.jar"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x64-macos"

CP_DEPEND="~dev-java/bcprov-${PV}:${SLOT}
	   ~dev-java/bcpkix-${PV}:${SLOT}
	   dev-java/junit:0
	   java-virtuals/jaf:0
	   dev-java/oracle-javamail:0"

DEPEND=">=virtual/jdk-1.7
	app-arch/unzip
	${CP_DEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CP_DEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="ISO-8859-1"
JAVA_SRC_DIR="org"
