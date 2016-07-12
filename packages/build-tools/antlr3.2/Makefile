PACKAGE = antlr3.2
VERSION = 3.2-14
LICENSE = BSD

LOCATION = http://http.debian.net/debian/pool/main/a/$(PACKAGE)/
TARBALLS = $(PACKAGE)_$(VERSION)_all.deb
# NOTE: we deliberately use the binary package as compiling Java is a bit of
# effort and, considering it is all-arch anyway, just a waste of time.

include packages/build-tools/common.mk

# prefix within the .deb package, usually /usr
build-prefix = /usr

install-files = \
	bin/antlr3.2 \
	share/java/antlr3-3.2.jar \
	share/java/antlr3-runtime-3.2.jar

$(pkgtree)/.do-install: $(pkgtree)/.extract
	cd $(prefix) && \
		for file in $(install-files) ; do \
			mkdir -p $$(dirname $${file}) ; \
			cp $(pkgbuildtree)$(build-prefix)/$${file} $${file} ; \
		done
	sed -i 's,/usr,$(prefix),g' $(prefix)/bin/antlr3.2
	[ -e $(prefix)/bin/antlr3 ] || \
		ln -s $(prefix)/bin/antlr3.2 $(prefix)/bin/antlr3
	$(call cmd,stamp)
