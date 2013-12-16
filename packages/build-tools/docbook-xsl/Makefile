PACKAGE = docbook-xsl
VERSION = 1.78.1
LICENSE = MIT-like

LOCATION = http://prdownloads.sf.net/docbook/$(PACKAGE)
TARBALLS = $(PACKAGE)-$(VERSION).tar.bz2

include packages/build-tools/common.mk
include packages/build-tools/xml.mk

dstdir = $(prefix)/share/xml/docbook/stylesheet/$(PACKAGE)

install-files = \
	catalog.xml \
	common \
	eclipse \
	epub/docbook.xsl \
	fo \
	highlighting \
	html \
	htmlhelp \
	images \
	javahelp \
	lib \
	manpages \
	profiling \
	roundtrip \
	slides \
	template \
	VERSION.xsl \
	website \
	xhtml-1_1 \
	xhtml

$(pkgtree)/.do-install: $(pkgtree)/.patch
	mkdir -p $(dstdir)
	tar -C $(pkgbuildtree) -c $(install-files) | tar -C $(dstdir) -x
	$(XMLCATALOG) --add delegateURI "http://docbook.sourceforge.net/release/xsl/" "file://$(dstdir)/catalog.xml" $(catalog)
	$(XMLCATALOG) --add delegateSystem "http://docbook.sourceforge.net/release/xsl/" "file://$(dstdir)/catalog.xml" $(catalog)
