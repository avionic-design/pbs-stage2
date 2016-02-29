PACKAGE = docbook-xml
VERSION = 4.5
LICENSE = custom

LOCATION = http://www.docbook.org/xml/$(VERSION)
TARBALLS = $(PACKAGE)-$(VERSION).zip

include packages/build-tools/common.mk
include packages/build-tools/xml.mk

unzip_pkgtree = $(pkgbuildtree)

dstdir = $(prefix)/share/xml/docbook/$(VERSION)
db_catalog = file://$(dstdir)/catalog.xml

install-files = \
	calstblx.dtd \
	catalog.xml \
	dbcentx.mod \
	dbgenent.mod \
	dbhierx.mod \
	dbnotnx.mod \
	dbpoolx.mod \
	docbook.cat \
	docbookx.dtd \
	ent \
	htmltblx.mod \
	soextblx.dtd

$(pkgtree)/.do-install: $(pkgtree)/.patch
	mkdir -p $(dstdir)
	tar -C $(pkgbuildtree) -c $(install-files) | tar -C $(dstdir) -x
	grep -q "$(db_catalog)" $(catalog) || \
		$(XMLCATALOG) --add nextCatalog "$(db_catalog)" "" $(catalog)
	$(call cmd,stamp)
