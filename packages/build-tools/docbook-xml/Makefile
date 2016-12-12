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
	# Generate /etc/xml/docbook -- though a bit duplicated with
	# $(db_catalog), this file is important for linking older versions to
	# this one (see below)
	[ ! -e $(catalogdir)/docbook ] && \
		$(XMLCATALOG) --create $(catalogdir)/docbook || true
	$(XMLCATALOG) --add "public" \
		"-//OASIS//DTD DocBook XML V$(VERSION)//EN" \
		"http://www.oasis-open.org/docbook/xml/$(VERSION)/docbookx.dtd" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//DTD DocBook XML CALS Table Model V$(VERSION)//EN" \
		"file://$(dstdir)/calstblx.dtd" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
		"file://$(dstdir)/soextblx.dtd" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ELEMENTS DocBook XML Information Pool V$(VERSION)//EN" \
		"file://$(dstdir)/dbpoolx.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ELEMENTS DocBook XML Document Hierarchy V$(VERSION)//EN" \
		"file://$(dstdir)/dbhierx.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ELEMENTS DocBook XML HTML Tables V$(VERSION)//EN" \
		"file://$(dstdir)/htmltblx.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ENTITIES DocBook XML Notations V$(VERSION)//EN" \
		"file://$(dstdir)/dbnotnx.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ENTITIES DocBook XML Character Entities V$(VERSION)//EN" \
		"file://$(dstdir)/dbcentx.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "public" \
		"-//OASIS//ENTITIES DocBook XML Additional General Entities V$(VERSION)//EN" \
		"file://$(dstdir)/dbgenent.mod" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "rewriteSystem" \
		"http://www.oasis-open.org/docbook/xml/$(VERSION)" \
		"file://$(dstdir)" \
		$(catalogdir)/docbook
	$(XMLCATALOG) --add "rewriteURI" \
		"http://www.oasis-open.org/docbook/xml/$(VERSION)" \
		"file://$(dstdir)" \
		$(catalogdir)/docbook
	# Add support for more DocBook XML versions by linking to the current
	for DTDVERSION in 4.1.2 4.2 4.3 4.4 ; do \
		$(XMLCATALOG) --add "public" \
			"-//OASIS//DTD DocBook XML V$${DTDVERSION}//EN" \
			"http://www.oasis-open.org/docbook/xml/$${DTDVERSION}/docbookx.dtd" \
			$(catalog) ; \
		$(XMLCATALOG) --add "rewriteSystem" \
			"http://www.oasis-open.org/docbook/xml/$${DTDVERSION}" \
			"file://$(dstdir)" \
			$(catalogdir)/docbook ; \
		$(XMLCATALOG) --add "rewriteURI" \
			"http://www.oasis-open.org/docbook/xml/$${DTDVERSION}" \
			"file://$(dstdir)" \
			$(catalogdir)/docbook ; \
		$(XMLCATALOG) --add "delegateSystem" \
			"http://www.oasis-open.org/docbook/xml/$${DTDVERSION}/" \
			"$(catalogdir)/docbook" \
			$(catalog) ; \
		$(XMLCATALOG) --add "delegateURI" \
			"http://www.oasis-open.org/docbook/xml/$${DTDVERSION}/" \
			"$(catalogdir)/docbook" \
			$(catalog) ; \
	done
	$(call cmd,stamp)
