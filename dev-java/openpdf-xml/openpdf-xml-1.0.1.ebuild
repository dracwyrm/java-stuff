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
KEYWORDS="~amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux"

CP_DEPEND="~dev-java/openpdf-1.0.1:0"

DEPEND=">=virtual/jdk-1.7
	${CP_DEPEND}"

RDEPEND=">=virtual/jre-1.7
	${CP_DEPEND}"

S="${WORKDIR}/OpenPDF-${PV}/pdf-xml"

JAVA_ENCODING="ISO-8859-1"
JAVA_SRC_DIR="src/main/java"
